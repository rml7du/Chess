class Board
    attr_accessor :array

    def initialize()
        @array = create_board()
        set_up()
    end

    def create_board()
        array = Array.new(8) { Array.new(8){" "} }
    end

    def set_up()
        #will add initial set up once piece classes are ready.
    end

    def print_board() #need to be able to print for both players
        @array.each {|x| print "+ - + - + - + - + - + - + - + - +\n| #{x.join(' | ')} |\n"}
        print "+ - + - + - + - + - + - + - + - +\n"
        #print "+---+---+---+---+---+---+---+---+\n" for later if want to change board aestetic
    end
end

board = Board.new()
board.print_board()