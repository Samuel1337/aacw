require_relative "slidable"
require_relative "piece"

class Rook < Piece
  include Slidable

  def initialize(pos, name="R")
    super(pos, name)
  end

  def valid_positions 
    moves = horizontal_dirs
    moves_select(moves)
  end

end

