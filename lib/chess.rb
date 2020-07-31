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
        #puts possible_moves()
        puts "#{@current_player.name} select where to move it"
    end

    def piece_selection() #converts human input into array and should only allow legal moves.
        selecters = {
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
        selection = gets.chomp.downcase
        selection.gsub!(/\w/, selecters) #error potential when two letters or two numbers input
        coordinates = selection.split()
        #puts selection
        #puts @board.array[selection[1].to_i][selection[0].to_i]
        puts "current player: #{@current_player.name}"

        if !('00'..'77').include?("#{selection}") #invalid selection
            puts "invalid selection, please try again"
            return false
        elsif @board.array[selection[1].to_i][selection[0].to_i] == " " #empty place
            puts "there is no piece there, try again"
            return false
        elsif @board.array[selection[1].to_i][selection[0].to_i].player != @current_player.player_number #opponute piece selected
            puts "cannot move opponites piece, try again"
            return false
        else 
            @board.selected_piece = @board.array[selection[1].to_i][selection[0].to_i]
            puts @board.selected_piece 
            return true
        end
        puts selection
        true
    end


end

game = Chess.new