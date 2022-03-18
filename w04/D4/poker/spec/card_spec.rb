require "card.rb"
require "rspec"

describe Card do
  subject(:card) {Card.new("2", "♣")}

  describe "#initialize" do
    it "gives cards a rank" do
      expect(card.rank).to eq("2")
    end

    it "gives cards a suit" do
      expect(card.suit).to eq("♣")
    end
  end

  describe "#to_s" do
    it "returs the rank and suit as a string" do
      expect(card.to_s).to eq("2♣")
    end
  end

end