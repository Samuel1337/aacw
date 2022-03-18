require_relative "card.rb"
class Deck
  attr_reader :cards
  RANKS = [2,3,4,5,6,7,8,9, 10,"J", "Q","K", "A"]
  SUITS = ["♣", "♦", "♥", "♠"]

  def initialize
    @cards= build_deck
  end

  def build_deck
    deck = []
    ranks = RANKS.map{|el| el.to_s}
    ranks.each do |rank|
      SUITS.each do |suit|
        deck << Card.new(rank, suit)
      end
    end
    deck
  end


end

d = Deck.new
d.cards.each { | card |puts card }