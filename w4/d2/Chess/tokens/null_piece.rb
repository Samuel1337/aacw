require_relative 'piece.rb'
require "singleton"

class NullPiece < Piece
  include Singleton
  attr_reader :color, :name
  def initialize
    @name = "_"
    @color = :none
  end

end

# n = NullPiece.instance
# p n