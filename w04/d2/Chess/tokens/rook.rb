require_relative "slidable"
require_relative "piece"

class Rook < Piece
  include Slidable

  def initialize(pos, board, name="R")
    super
  end

  def valid_positions 
    moves = horizontal_dirs
    moves_select(moves)
  end

end

