require "./lib/bishop"
require "./lib/board"
require "./lib/king"
require "./lib/knight"
require "./lib/pawn"
require "./lib/player"
require "./lib/queen"
require "./lib/rook"

class Chess
    def initialize()
        @player1 = Player.new
        @player2 = Player.new
        @board = Board.new(@player1, @player2)
        @turn = 1
        @current_player
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
        gameplay()
    end

    def gameplay()
        while @board.check_mate() == false
            @turn % 2 == 1 ? @current_player = @player1 : @current_player = @player2
            player_turn()
            @turn+=1
        end
    end

    def player_turn()
        @board.print_board(@turn)
        puts "#{@current_player.name}'s turn. Select a piece to move (type current location, ex: a4)"
        while !piece_selection()
        end
        #@board.print_possible_moves(@board.selected_piece.possible_moves())
        @board.print_board(@turn)
        puts "#{@current_player.name} select where to move it"
        print @board.selected_piece.possible_moves()
        while !piece_move()
        end
        
    end

    def piece_move()#need to validate its a valid move
        selection = gets.chomp.downcase
        selection.gsub!(/\w/, @selecters)
        if !(@board.selected_piece.possible_moves().join(',')).include?("#{selection}") #invalid move
            puts "invalid move, please try again"
            return false
        else
            @board.array[@board.selected_piece.x][@board.selected_piece.y] = " "
            @board.array[selection[1].to_i][selection[0].to_i] = @board.selected_piece
            @board.selected_piece.x = selection[1].to_i
            @board.selected_piece.y = selection[0].to_i
            puts "selected piece new coordinates: #{@board.selected_piece.x}, #{@board.selected_piece.y}"
            return true
        end
        
            
            
        #delete puts "this is the selected piece: #{@board.selected_piece} and its coordinates: #{@board.selected_piece.x},#{@board.selected_piece.y} "
        
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
        #elsif selected piece has no possible moves, return false    
        else 
            @board.selected_piece = @board.array[selection[1].to_i][selection[0].to_i]
            #puts @board.selected_piece 
            return true
        end
    end


end

game = Chess.new