require_relative "slidable"
require_relative 'piece'

class Queen < Piece
  include Slidable

  def initialize(pos, name="Q")
    super(pos, name)

  end

  def valid_positions 

    moves = horizontal_dirs + diagonal_dirs
    moves_select(moves)
  end

end

# q = Queen.new([0,4])

# q.valid_positions