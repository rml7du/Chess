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

    def possible_moves(board)
        array = []
        #diagnols
        y = @x - 1
        x = @y - 1
        until x < 0 || y < 0
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player #opponutes piece
                array << "#{x}#{y}"
                y = -1
            else
                y = -1 #remaining option is your own piece
            end     
            y -=1
            x -=1
        end

        y = @x + 1
        x = @y + 1
        until x > 7 || y > 7
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player  #opponutes piece
                array << "#{x}#{y}"
                y = 9
            else
                y = 9 #remaining option is your own piece
            end     
            y +=1
            x +=1
        end

        y = @x + 1
        x = @y - 1
        until x < 0 || y > 7
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player #opponutes piece
                array << "#{x}#{y}"
                y = 8
            else
                y = 8 #remaining option is your own piece
            end     
            y +=1
            x -=1
        end

        y = @x - 1
        x = @y + 1
        until x > 7 || y < 0
            if board.array[y][x] == " " #empty spot
                array << "#{x}#{y}"   
            elsif board.array[y][x].player != self.player #opponutes piece
                array << "#{x}#{y}"
                y = -1
            else
                y = -1 #remaining option is your own piece or off the board
            end     
            y -=1
            x +=1
        end

        return array
    end
end