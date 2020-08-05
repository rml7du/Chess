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

    def possible_moves(board)
        array = []

        #horizontals
        x = @y - 1
        if x >= 0
            if board.array[@x][x] == " " #empty spot
                array << "#{x}#{@x}"   
            elsif board.array[@x][x].player != self.player  #opponutes piece
                array << "#{x}#{@x}"
            end
        end

        x = @y + 1
        if x <= 7
            if board.array[@x][x] == " " #empty spot
                array << "#{x}#{@x}"   
            elsif board.array[@x][x].player != self.player #opponutes piece
                array << "#{x}#{@x}"
            end
        end

        #verticals
        y = @x + 1
        if y <= 7
            if board.array[y][@y] == " " #empty spot
                array << "#{@y}#{y}"   
            elsif board.array[y][@y].player != self.player #opponutes piece
                array << "#{@y}#{y}"
            end
        end

        y = @x - 1
        if y >= 0
            if board.array[y][@y] == " " #empty spot
                array << "#{@y}#{y}"   
            elsif board.array[y][@y].player != self.player #opponutes piece
                array << "#{@y}#{y}"
            end
        end
        
        #diagnols
        y = @x - 1
        x = @y - 1
        if x >= 0 && y >= 0
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player #opponutes piece
                array << "#{x}#{y}"
            end
        end

        y = @x + 1
        x = @y + 1
        if x <= 7 && y <= 7
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player #opponutes piece
                array << "#{x}#{y}"
            end
        end

        y = @x + 1
        x = @y - 1
        if x >= 0 && y <= 7
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player #opponutes piece
                array << "#{x}#{y}"
            end
        end

        y = @x - 1
        x = @y + 1
        if x <= 7 && y >= 0
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player #opponutes piece
                array << "#{x}#{y}"
            end
        end

        return array

    end
end