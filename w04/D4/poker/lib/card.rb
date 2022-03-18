require "byebug"
class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    # debugger
    puts rank + suit

  end
end

c = Card.new("2", "♣")
c.to_s