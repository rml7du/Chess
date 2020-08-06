require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "pawn"
require_relative "player"
require_relative "queen"
require_relative "rook"

class Board
    attr_accessor :array, :player1, :player2, :selected_piece, :checked

    def initialize(player1, player2)
        @array = create_board()
        @player1 = player1
        @player2 = player2
        @selected_piece
        @checked = false
        @king1
        @king2
        set_up()
        puts "Hello #{@player1.name} and #{@player2.name}, lets play."
    end

    def create_board()
        array = Array.new(8) { Array.new(8){" "} }
    end

    def set_up()
        @rook21 =   Rook.new(0,0, @player2.player_number)
        @knight21 = Knight.new(0,1, @player2.player_number)
        @bishop21 = Bishop.new(0,2, @player2.player_number)
        @queen2 =   Queen.new(0,3, @player2.player_number)
        @king2 =    King.new(0,4, @player2.player_number) #so can reference king by name later
        @bishop22 = Bishop.new(0,5, @player2.player_number)
        @knight22 = Knight.new(0,6, @player2.player_number)
        @rook22 =   Rook.new(0,7, @player2.player_number)

        @pawn21 = Pawn.new(1,0, @player2.player_number)
        @pawn22 = Pawn.new(1,1, @player2.player_number)
        @pawn23 = Pawn.new(1,2, @player2.player_number)
        @pawn24 = Pawn.new(1,3, @player2.player_number)
        @pawn25 = Pawn.new(1,4, @player2.player_number)
        @pawn26 = Pawn.new(1,5, @player2.player_number)
        @pawn27 = Pawn.new(1,6, @player2.player_number)
        @pawn28 = Pawn.new(1,7, @player2.player_number)

        @player2.player_pieces = [  @pawn21, @pawn22, @pawn23, @pawn24, @pawn25, @pawn26, @pawn27, @pawn28,
                                    @rook21, @knight21, @bishop21, @queen2, @king2, @bishop22, @knight22, @rook22 ]
        #puts @player2.player_pieces


        @array[0][0] = @rook21 #Rook.new(0,0, @player2.player_number)
        @array[0][1] = @knight21 #Knight.new(0,1, @player2.player_number)
        @array[0][2] = @bishop21 #Bishop.new(0,2, @player2.player_number)
        @array[0][3] = @queen2 #Queen.new(0,3, @player2.player_number)
        @array[0][4] = @king2 
        @array[0][5] = @bishop22 #Bishop.new(0,5, @player2.player_number)
        @array[0][6] = @knight22 #Knight.new(0,6, @player2.player_number)
        @array[0][7] = @rook22 #Rook.new(0,7, @player2.player_number)

        @array[1][0] = @pawn21 #Pawn.new(1,0, @player2.player_number)
        @array[1][1] = @pawn22 #Pawn.new(1,1, @player2.player_number)
        @array[1][2] = @pawn23 #Pawn.new(1,2, @player2.player_number)
        @array[1][3] = @pawn24 #Pawn.new(1,3, @player2.player_number)
        @array[1][4] = @pawn25 #Pawn.new(1,4, @player2.player_number)
        @array[1][5] = @pawn26 #Pawn.new(1,5, @player2.player_number)
        @array[1][6] = @pawn27 #Pawn.new(1,6, @player2.player_number)
        @array[1][7] = @pawn28 #Pawn.new(1,7, @player2.player_number)

        
        @rook11 = Rook.new(7,0, @player1.player_number)
        @knight11 = Knight.new(7,1, @player1.player_number)
        @bishop11 = Bishop.new(7,2, @player1.player_number)
        @queen1 = Queen.new(7,3, @player1.player_number)
        @king1 = King.new(7,4, @player1.player_number) #so can refernce king by name later
        @bishop12 = Bishop.new(7,5, @player1.player_number)
        @knight12 = Knight.new(7,6, @player1.player_number)
        @rook12 = Rook.new(7,7, @player1.player_number) 

        @pawn11 = Pawn.new(6,0, @player1.player_number)
        @pawn12 = Pawn.new(6,1, @player1.player_number)
        @pawn13 = Pawn.new(6,2, @player1.player_number)
        @pawn14 = Pawn.new(6,3, @player1.player_number)
        @pawn15 = Pawn.new(6,4, @player1.player_number)
        @pawn16 = Pawn.new(6,5, @player1.player_number)
        @pawn17 = Pawn.new(6,6, @player1.player_number)
        @pawn18 = Pawn.new(6,7, @player1.player_number)
        
        
        @array[7][0] = @rook11 #Rook.new(7,0, @player1.player_number)
        @array[7][1] = @knight11 #Knight.new(7,1, @player1.player_number)
        @array[7][2] = @bishop11 #Bishop.new(7,2, @player1.player_number)
        @array[7][3] = @queen1 #Queen.new(7,3, @player1.player_number)
        @array[7][4] = @king1 
        @array[7][5] = @bishop12 #Bishop.new(7,5, @player1.player_number)
        @array[7][6] = @knight12 #Knight.new(7,6, @player1.player_number)
        @array[7][7] = @rook12 #Rook.new(7,7, @player1.player_number)

        @array[6][0] = @pawn11 #Pawn.new(6,0, @player1.player_number)
        @array[6][1] = @pawn12 #Pawn.new(6,1, @player1.player_number)
        @array[6][2] = @pawn13 #Pawn.new(6,2, @player1.player_number)
        @array[6][3] = @pawn14 #Pawn.new(6,3, @player1.player_number)
        @array[6][4] = @pawn15 #Pawn.new(6,4, @player1.player_number)
        @array[6][5] = @pawn16 #Pawn.new(6,5, @player1.player_number)
        @array[6][6] = @pawn17 #Pawn.new(6,6, @player1.player_number)
        @array[6][7] = @pawn18 #Pawn.new(6,7, @player1.player_number)

        @player1.player_pieces = [  @pawn11, @pawn12, @pawn13, @pawn14, @pawn15, @pawn16, @pawn17, @pawn18,
            @rook11, @knight11, @bishop11, @queen1, @king1, @bishop12, @knight12, @rook12 ]
        #puts @player1.player_pieces
    end

    def check_mate(current_player)
        if current_player == @player2 
            king = @king1
            opponent = @player2
        else 
            king = @king2 #king_coord = "#{@king2.y}#{@king2.x}" : king = "#{@king1.y}#{@king1.x}"
            opponent = @player1
        end
        king_moves = king.possible_moves(self)
        king_moves << "#{king.y}#{king.x}"
        print "kingmoves: #{king_moves} \n"
        total_moves = []
        opponent.player_pieces.each do |x| 
            array = x.possible_moves(self) 
            total_moves << array
        end
        if king_moves - total_moves.flatten == []
            puts "CHECKMATE"
            return true
        end
        print "kingmoves - totalmoves: #{king_moves} \n"
        #current_player.player_pieces.each { |x| array << x.possible_moves(self)

        #print array
        #array = @selected_piece.possible_moves(self)
        #array.include?(king_coord) ? @checked = true : @checked = false
        #needs to be written to show king is unable to move
        return false
    end

    def print_possible_moves(possible_moves)
        temp = @array
        i = 0
        possible_moves.length.times do
            coord = possible_moves[i]
            @array[coord[0]][coord[1]] = "\u2299"
            i+=1
        end
        return temp
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

    def is_king_checked(current_player)
        current_player == @player1 ? king_coord = "#{@king2.y}#{@king2.x}" : king_coord = "#{@king1.y}#{@king1.x}"
        print "king: #{king_coord}"
        array = @selected_piece.possible_moves(self)
        array.include?(king_coord) ? @checked = true : @checked = false
    end
end

