require "./lib/bishop"
require "./lib/board"
require "./lib/chess"
require "./lib/king"
require "./lib/knight"
require "./lib/pawn"
require "./lib/player"
require "./lib/queen"
require "./lib/rook"


describe Player do
    it "Should create a player" do
        player = Player.new("player1")
        expect(player.name).to eql("player1")
    end

    it "Should store player 1 piece" do
        player = Player.new("player1")
        expect(player.piece).to eql("White")
    end

    it "Should store player 2 piece" do
        player2 = Player.new("player2")
        expect(player2.piece).to eql("Black")
    end
end

describe Board do
    it "Should create an 8x8 game board" do
        board = Board.new()
        expect(board.flatten.length).to eql(64)
    end

    it "Should populate the board with the starting pieces" do
        board = Board.new()
        expect(board.array[2,2]).to eql("pawn")
    end
end

describe Knight do
    it "Should create a knight game piece" do
        knight = Knight.new()
        expect(knight.char_code).to eql(\u2658)
    end
end

