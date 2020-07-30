require "./lib/bishop"
require "./lib/board"
require "./lib/chess"
require "./lib/king"
require "./lib/knight"
require "./lib/pawn"
require "./lib/player"
require "./lib/queen"
require "./lib/rook"

class Chess
    def initialize()
        @board = Board.new
        @turn = 1
        gameplay()
    end

    def gameplay()
        if @turn % 2 == 1
            puts "its #{@board.player1.name}'s turn"
            @board.print_board(@turn)
        else
            puts "its #{@board.palyer2.name}'s turn"
            @board.pring_board(@turn)
        end
    end

end

game = Chess.new