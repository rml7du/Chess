require_relative "board"

class Chess
    include BasicSerialization
    def initialize()
        #load()
        @player1 = Player.new
        @player2 = Player.new
        @board = Board.new(@player1, @player2)
        load()
        @turn = 1
        @current_player = @player2
        @selecters = { #used to translate input into array coordinates
            "a" => 0,
            "b" => 1,
            "c" => 2,
            "d" => 3,
            "e" => 4,
            "f" => 5,
            "g" => 6,
            "h" => 7,

            "1" => 0,
            "2" => 1,
            "3" => 2,
            "4" => 3,
            "5" => 4,
            "6" => 5,
            "7" => 6,
            "8" => 7
        }
        @converters = { #used to translate array coordinates into output
            "00" => "a1",
            "01" => "a2",
            "02" => "a3",
            "03" => "a4",
            "04" => "a5",
            "05" => "a6",
            "06" => "a7",
            "07" => "a8",

            "10" => "b1",
            "11" => "b2",
            "12" => "b3",
            "13" => "b4",
            "14" => "b5",
            "15" => "b6",
            "16" => "b7",
            "17" => "b8",

            "20" => "c1",
            "21" => "c2",
            "22" => "c3",
            "23" => "c4",
            "24" => "c5",
            "25" => "c6",
            "26" => "c7",
            "27" => "c8",

            "30" => "d1",
            "31" => "d2",
            "32" => "d3",
            "33" => "d4",
            "34" => "d5",
            "35" => "d6",
            "36" => "d7",
            "37" => "d8",

            "40" => "e1",
            "41" => "e2",
            "42" => "e3",
            "43" => "e4",
            "44" => "e5",
            "45" => "e6",
            "46" => "e7",
            "47" => "e8",

            "50" => "f1",
            "51" => "f2",
            "52" => "f3",
            "53" => "f4",
            "54" => "f5",
            "55" => "f6",
            "56" => "f7",
            "57" => "f8",

            "60" => "g1",
            "61" => "g2",
            "62" => "g3",
            "63" => "g4",
            "64" => "g5",
            "65" => "g6",
            "66" => "g7",
            "67" => "g8",

            "70" => "h1",
            "71" => "h2",
            "72" => "h3",
            "73" => "h4",
            "74" => "h5",
            "75" => "h6",
            "76" => "h7",
            "77" => "h8",
            
            
        }
        gameplay()
    end

    def load()
        puts "Would you like to load the previous saved game? (type 1 if yes)"
        if gets.chomp == '1'
            @board.unserialize()
        end
    end

    def gameplay()
        while @board.checkmate == false
            if @turn % 5 == 0
                puts "Would you like to save your progress? (1 for yes, 2 for no)"
                if gets.chomp == '1'
                    File.open("save.yml", "w") { |file| file.write(@board.serialize()) }
                    break
                end
            end
            @turn % 2 == 1 ? @current_player = @player1 : @current_player = @player2
            player_turn()
            @board.check_mate(@current_player)
            @turn+=1
        end
    end

    def player_turn() #select a piece and tell it where to move
        @board.print_board(@turn)
        if @board.checked
            puts "You are in CHECK and must defend your king"
        else
            puts "#{@current_player.name}'s turn. Select a piece to move (type current location, ex: a4)"
        end
        while !piece_selection() #assigns selected_piece
        end
        puts "#{@current_player.name}, select where to move it:"
        if (@board.selected_piece == @board.king1 || @board.selected_piece == @board.king2)   #kings cannot move into danger so need to remove additional illegal moves
            moves = @board.selected_piece.possible_moves(@board) - @board.illegal_moves(@current_player) 
        else 
            moves = @board.selected_piece.possible_moves(@board)
        end
        moves.each { |x| x.gsub!(/\w+/, @converters) }
        print "#{moves} \n"
        while !piece_move() ##need to add a way to change which piece want to move even after youve selected a different piece.
        end
        @board.is_king_checked(@current_player)
    end

    def piece_move() #need to validate its a valid move
        selection = gets.chomp.downcase
        selection.gsub!(/\w/, @selecters)
        if !(@board.selected_piece.possible_moves(@board).join(',')).include?("#{selection}") #invalid move
            puts "invalid move, please try again"
            return false
        else
            @board.array[@board.selected_piece.x][@board.selected_piece.y] = " "
            @board.array[selection[1].to_i][selection[0].to_i] = @board.selected_piece
            @board.selected_piece.x = selection[1].to_i
            @board.selected_piece.y = selection[0].to_i
            return true
        end        
    end

    def piece_selection() #converts human input into array and should only allow legal moves.
        
        selection = gets.chomp.downcase
        selection.gsub!(/\w/, @selecters) #error potential when two letters or two numbers input

        if !('00'..'77').include?("#{selection}") #invalid selection
            puts "invalid selection, please try again"
            return false
        elsif @board.array[selection[1].to_i][selection[0].to_i] == " " #empty place
            puts "there is no piece there, try again"
            return false
        elsif @board.array[selection[1].to_i][selection[0].to_i].player != @current_player.player_number #opponute piece selected
            puts "cannot move opponites piece, try again"
            return false
        elsif @board.array[selection[1].to_i][selection[0].to_i].possible_moves(@board) == [] #no possible moves
            puts "selected piece has no possible moves, try again" 
            return false  
        elsif (@board.array[selection[1].to_i][selection[0].to_i] == @board.king1 || @board.array[selection[1].to_i][selection[0].to_i] == @board.king2) && @board.array[selection[1].to_i][selection[0].to_i].possible_moves(@board) - @board.illegal_moves(@current_player) == [] #kings cannot move into danger so need to remove additional illegal moves
            puts "King has no saving moves, try again" 
            return false  
        #elsif #how do we make sure the pieces make a legal move that leaves king in check
        else 
            @board.selected_piece = @board.array[selection[1].to_i][selection[0].to_i]
            return true
        end
    end
end

game = Chess.new