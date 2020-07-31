class Queen
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2655" : "\u265B" 
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves()
        return [
        #diagnols
        [@y + 1, @x + 1],
        [@y + 2, @x + 2],
        [@y + 3, @x + 3],
        [@y + 4, @x + 4],
        [@y + 5, @x + 5],
        [@y + 6, @x + 6],
        [@y + 7, @x + 7],

        [@y + 1, @x - 1],
        [@y + 2, @x - 2],
        [@y + 3, @x - 3],
        [@y + 4, @x - 4],
        [@y + 5, @x - 5],
        [@y + 6, @x - 6],
        [@y + 7, @x - 7],

        [@y - 1, @x - 1],
        [@y - 2, @x - 2],
        [@y - 3, @x - 3],
        [@y - 4, @x - 4],
        [@y - 5, @x - 5],
        [@y - 6, @x - 6],
        [@y - 7, @x - 7],

        [@y - 1, @x + 1],
        [@y - 2, @x + 2],
        [@y - 3, @x + 3],
        [@y - 4, @x + 4],
        [@y - 5, @x + 5],
        [@y - 6, @x + 6],
        [@y - 7, @x + 7],

        #horizontals
        [@y, @x + 1],
        [@y, @x + 2],
        [@y, @x + 3],
        [@y, @x + 4],
        [@y, @x + 5],
        [@y, @x + 6],
        [@y, @x + 7],

        [@y, @x - 1],
        [@y, @x - 2],
        [@y, @x - 3],
        [@y, @x - 4],
        [@y, @x - 5],
        [@y, @x - 6],
        [@y, @x - 7],

        #verticals
        [@y + 1, @x],
        [@y + 2, @x],
        [@y + 3, @x],
        [@y + 4, @x],
        [@y + 5, @x],
        [@y + 6, @x],
        [@y + 7, @x],

        [@y - 1, @x],
        [@y - 2, @x],
        [@y - 3, @x],
        [@y - 4, @x],
        [@y - 5, @x],
        [@y - 6, @x],
        [@y - 7, @x] ]
        
    end
end