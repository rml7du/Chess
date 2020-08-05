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

    def possible_moves(board)
        array = []

        x = @y + 1
        y = @x + 2
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end   
        
        x = @y + 1
        y = @x - 2
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end

        x = @y + 2
        y = @x + 1
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end
        
        x = @y + 2
        y = @x - 1
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end

        x = @y - 1
        y = @x + 2
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end   
        
        x = @y - 1
        y = @x - 2
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end

        x = @y - 2
        y = @x + 1
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end
        
        x = @y - 2
        y = @x - 1
        if (x >= 0 && x <= 7) && (y >= 0 && y <=7)
            array << "#{x}#{y}"  if board.array[y][x] == " " || board.array[y][x].player != self.player
        end


        return array
    end
end