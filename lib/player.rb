class Player
    attr_accessor :name, :player_number, :player_count, :player_pieces
    @@player_count = 0

    def initialize()
        @@player_count += 1
        @name = enter_name()
        @player_number = @@player_count
        @player_pieces = []
    end

    def enter_name()
        puts "Hello player #{@@player_count}, please enter your name:"
        return gets.chomp
    end
end