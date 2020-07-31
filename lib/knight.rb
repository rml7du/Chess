class Knight
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2658" : "\u265E" 
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves()
        array = [ 
        [@y + 1, @x + 2],
        [@y + 1, @x - 2],
        [@y + 2, @x + 1],
        [@y + 2, @x - 1],
        [@y - 1, @x + 2],
        [@y - 1, @x - 2],
        [@y - 2, @x + 1],
        [@y - 2, @x - 1] ]

        return array.each_with_index { |x,i|  array[i] = x.join('') }
    end
end