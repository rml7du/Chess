require "./lib/bishop"
require "./lib/board"
#require "./lib/chess"
require "./lib/king"
require "./lib/knight"
require "./lib/pawn"
require "./lib/player"
require "./lib/queen"
require "./lib/rook"

class Board
    attr_accessor :array

    def initialize()
        @array = create_board()
        @player1 = Player.new
        @player2 = Player.new
        set_up()
        puts "Hello #{@player1.name} and #{@player2.name}, lets play."
    end

    def create_board()
        array = Array.new(8) { Array.new(8){" "} }
    end

    def set_up()
        @array[0][0] = Bishop.new(0,0, @player1.player_number)
        @array[0][1] = Knight.new(0,1, @player1.player_number)
        @array[0][2] = Bishop.new(0,2, @player1.player_number)
        @array[0][3] = Queen.new(0,3, @player1.player_number)
        @array[0][4] = King.new(0,4, @player1.player_number)
        @array[0][5] = Bishop.new(0,5, @player1.player_number)
        @array[0][6] = Knight.new(0,6, @player1.player_number)
        @array[0][7] = Rook.new(0,7, @player1.player_number)

        @array[1][0] = Pawn.new(1,0, @player1.player_number)
        @array[1][1] = Pawn.new(1,1, @player1.player_number)
        @array[1][2] = Pawn.new(1,2, @player1.player_number)
        @array[1][3] = Pawn.new(1,3, @player1.player_number)
        @array[1][4] = Pawn.new(1,4, @player1.player_number)
        @array[1][5] = Pawn.new(1,5, @player1.player_number)
        @array[1][6] = Pawn.new(1,6, @player1.player_number)
        @array[1][7] = Pawn.new(1,7, @player1.player_number)

        @array[7][0] = Bishop.new(7,0, @player2.player_number)
        @array[7][1] = Knight.new(7,1, @player2.player_number)
        @array[7][2] = Bishop.new(7,2, @player2.player_number)
        @array[7][3] = Queen.new(7,3, @player2.player_number)
        @array[7][4] = King.new(7,4, @player2.player_number)
        @array[7][5] = Bishop.new(7,5, @player2.player_number)
        @array[7][6] = Knight.new(7,6, @player2.player_number)
        @array[7][7] = Rook.new(7,7, @player2.player_number)

        @array[6][0] = Pawn.new(6,0, @player2.player_number)
        @array[6][1] = Pawn.new(2,1, @player2.player_number)
        @array[6][2] = Pawn.new(2,2, @player2.player_number)
        @array[6][3] = Pawn.new(2,3, @player2.player_number)
        @array[6][4] = Pawn.new(2,4, @player2.player_number)
        @array[6][5] = Pawn.new(2,5, @player2.player_number)
        @array[6][6] = Pawn.new(2,6, @player2.player_number)
        @array[4][7] = Pawn.new(2,7, @player2.player_number)
      
        
    end

    def print_board(player_turn) #need to be able to print for both players
        if player_turn % 2 == 1
            y = 1
            puts "\n\n"
            puts "     a   b   c   d   e   f   g   h  " 
            @array.each do |x| 
                print "   + - + - + - + - + - + - + - + - +\n#{y}  | #{x.join(' | ')} |\n"
                y +=1
            end
            puts "   + - + - + - + - + - + - + - + - +"
            puts "     a   b   c   d   e   f   g   h  " 
            puts "\n"           
        else
            y = 8
            puts "\n\n"
            puts "     h   g   f   e   d   c   b   a  "
            @array.reverse.each do |x| 
                print "   + - + - + - + - + - + - + - + - +\n#{y}  | #{x.reverse.join(' | ')} |\n"
                y -=1
            end
            puts "   + - + - + - + - + - + - + - + - +"
            puts "     h   g   f   e   d   c   b   a  "
            puts "\n"
        end
        #print "+---+---+---+---+---+---+---+---+\n" for later if want to change board aestetic
    end
end

board = Board.new()
board.print_board(1)
board.print_board(2)