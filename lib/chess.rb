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
        gameplay()
    end

    def gameplay()
        while @board.check_mate() == false
            @turn % 2 == 1 ? current_player = @player1 : current_player = @player2
            player_turn(current_player)
            @turn+=1
        end
    end

    def player_turn()
        @board.print_board
        puts "Select a piece to move (a4)"
        while !selection()
        end
        #puts possible_moves()
        puts "Select where to move it"
    end

    def selection()
        selection = gets.chomp
        selection.gsub(/[a-z]/){|c|s.index©+1}
        print selection
    end


end

game = Chess.new