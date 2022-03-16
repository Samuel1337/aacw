require_relative "piece.rb"
require "singleton"

class Pawn < Piece
  def initialize(pos, board, color)
    super
    @symbol = :p
  end
end