require_relative 'piece.rb'
require "singleton"

class NullPiece < Piece
  include Singleton
  attr_reader :color, :name
  def initialize
    @name = " "
    @color = :none
  end

end

# n = NullPiece.instance
# p n