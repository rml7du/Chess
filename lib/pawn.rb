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

    def possible_moves()
        return [[@y + 1,@x],[@y + 2,@x]]
    end

end
