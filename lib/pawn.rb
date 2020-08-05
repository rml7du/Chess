class Pawn
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2659".blue : "\u265F".green
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves(board)#pawns can only move forward so some are moving in the negative direction.
        array = []
        if player % 2 == 1 
            y = @x - 1
            if y >= 0
                #verticals
                if board.array[y][@y] == " " && board.array[y-1][@y] == " "#empty spot
                    array << "#{@y}#{y}"   
                    array << "#{@y}#{y-1}"
                elsif board.array[y][@y] == " "
                    array << "#{@y}#{y}"   
                end
                #diagonal 
                if @y < 7 && board.array[y][@y+1] != " " && board.array[y][@y+1].player != self.player
                    array << "#{@y+1}#{y}" 
                elsif @y > 0 && board.array[y][@y-1] != " " && board.array[y][@y-1].player != self.player
                    array << "#{@y-1}#{y}" 
                end
            end
        else
            y = @x + 1
            if y <= 7
                #verticals
                if board.array[y][@y] == " " && board.array[y+1][@y] == " "#empty spot
                    array << "#{@y}#{y}"   
                    array << "#{@y}#{y+1}"
                elsif board.array[y][@y] == " "
                    array << "#{@y}#{y}"   
                end
                #diagonal 
                if @y < 7 && board.array[y][@y+1] != " " && board.array[y][@y+1].player != self.player
                    array << "#{@y+1}#{y}" 
                elsif @y > 0 && board.array[y][@y-1] != " " && board.array[y][@y-1].player != self.player
                    array << "#{@y-1}#{y}" 
                end
            end
        end

        return array
            
    end

end
