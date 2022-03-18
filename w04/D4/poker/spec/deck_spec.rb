require "deck.rb"
require "rspec"

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates 52 cards" do
      expect(deck.cards.length).to be(52)
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.length).to be(52)

    end
  end



end