class King
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2654" : "\u265A" 
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves()
        return [
        #diagnols
        [@y + 1, @x + 1],
        [@y + 1, @x - 1],
        [@y - 1, @x - 1],
        [@y - 1, @x + 1],

        #horizontals
        [@y, @x + 1],
        [@y, @x - 1],

        #verticals
        [@y + 1, @x],
        [@y - 1, @x] ]
        
    end
end