class Pawn
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2659" : "\u265F" 
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves()#pawns can only move forward so some are moving in the negative direction.
        player % 2 == 1 ? [[@y,@x - 1],[@y,@x-2]] : [[@y,@x+1],[@y,@x+2]] 
        #player % 2 == 1 ? [[@x,@y - 1],[@x, @y - 2]] : [[@x, @y + 1],[@x, @y + 2]] 
    end

end
