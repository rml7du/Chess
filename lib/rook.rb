class Rook
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2656" : "\u265C" 
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves()

        #horizontals
        [@y, @x + 1]
        [@y, @x + 2]
        [@y, @x + 3]
        [@y, @x + 4]
        [@y, @x + 5]
        [@y, @x + 6]
        [@y, @x + 7]

        [@y, @x - 1]
        [@y, @x - 2]
        [@y, @x - 3]
        [@y, @x - 4]
        [@y, @x - 5]
        [@y, @x - 6]
        [@y, @x - 7]

        #verticals
        [@y + 1, @x]
        [@y + 2, @x]
        [@y + 3, @x]
        [@y + 4, @x]
        [@y + 5, @x]
        [@y + 6, @x]
        [@y + 7, @x]

        [@y - 1, @x]
        [@y - 2, @x]
        [@y - 3, @x]
        [@y - 4, @x]
        [@y - 5, @x]
        [@y - 6, @x]
        [@y - 7, @x]
        
    end
end