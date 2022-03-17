require "game.rb"

describe Game do
  subject(:game) { Game.new }


  describe "#initialize" do

    context "it initializes a board" do

      it "stores the board is an array" do
        expect(game.board).to be_a(Array)
      end

      it "starts with all tokens in the first tower" do
        expect(game.board[0]).to eq([4,3,2,1])
        expect(game.board[1]).to eq([])
      end

    end

  end

  describe "#move" do
      it "changes the board" do
        arr = [0,1]
        game.move(arr)
        expect(game.board).to eq([[4,3,2],[1],[]])
    end
  end

  describe "#won?" do
  
    context "when the game is won" do
      it "returns true" do
        game.board = [[], [], [4,3,2,1]]
        expect(game.won?).to be(true)
      end
    end

    context "when the game is not over" do
      it "returns false" do
        expect(game.won?).to be(false)
      end
    end
  end
end