require_relative "slidable"
require_relative 'piece'

class Bishop < Piece
include Slidable

  def initialize(pos, name="B")
    super(pos, name)
  end

  def valid_positions 
    moves = diagonal_dirs
    moves_select(moves)
  end

end

b = Bishop.new([0, 2])
p b.valid_positions