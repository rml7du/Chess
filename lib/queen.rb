#require "./lib/board"
require 'colorize'

class Queen
    attr_accessor :x, :y, :player, :code

    def initialize(x, y, player)
        @x = x
        @y = y
        @player = player
        @code = character_code(@player)
    end

    def character_code(player)
        player % 2 == 0 ? "\u2655".blue : "\u265B".green
    end

    def to_s()
        "#{@code}"
    end

    def possible_moves(board)
        array = []

        #horizontals
        x = @y - 1
        until x < 0
            if board.array[@x][x] == " " #empty spot
                array << "#{x}#{@x}"   
            elsif board.array[@x][x].player != self.player  #opponutes piece
                array << "#{x}#{@x}"
                x = -1
            else
                x = -1 #remaining option is your own piece or off the board
            end     
            x -=1
        end

        x = @y + 1
        until x > 7
            if board.array[@x][x] == " " #empty spot
                array << "#{x}#{@x}"   
            elsif board.array[@x][x].player != self.player #opponutes piece
                array << "#{x}#{@x}"
                x = 8
            else
                x = 8 #remaining option is your own piece or off the board
            end     
            x +=1
        end

        #verticals
        y = @x + 1
        until y > 7
            if board.array[y][@y] == " " #empty spot
                array << "#{@y}#{y}"   
            elsif board.array[y][@y].player != self.player #opponutes piece
                array << "#{@y}#{y}"
                y = 8
            else
                y = 8 #remaining option is your own piece or off the board
            end     
            y +=1
        end

        y = @x - 1
        until y < 0
            if board.array[y][@y] == " " #empty spot
                array << "#{@y}#{y}"   
            elsif board.array[y][@y].player != self.player #opponutes piece
                array << "#{@y}#{y}"
                y = -1
            else
                y = -1 #remaining option is your own piece
            end     
            y -=1
        end
        
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
            elsif board.array[y][x].player != self.player #opponutes piece
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
                y = -1 #remaining option is your own piece
            end     
            y -=1
            x +=1
        end


        return array
    end

end