class Bishop
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2657" : "\u265D" 
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves()

        [@y + 1, @x + 1]
        [@y + 2, @x + 2]
        [@y + 3, @x + 3]
        [@y + 4, @x + 4]
        [@y + 5, @x + 5]
        [@y + 6, @x + 6]

        [@y + 1, @x - 1]
        [@y + 2, @x - 2]
        [@y + 3, @x - 3]
        [@y + 4, @x - 4]
        [@y + 5, @x - 5]
        [@y + 6, @x - 6]

        [@y - 1, @x - 1]
        [@y - 2, @x - 2]
        [@y - 3, @x - 3]
        [@y - 4, @x - 4]
        [@y - 5, @x - 5]
        [@y - 6, @x - 6]

        [@y - 1, @x + 1]
        [@y - 2, @x + 2]
        [@y - 3, @x + 3]
        [@y - 4, @x + 4]
        [@y - 5, @x + 5]
        [@y - 6, @x + 6]
        
    end
end