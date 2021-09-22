require_relative "slidable"
require_relative 'piece'

class Queen < Piece
  include Slidable

  def initialize(pos, name="Q")
    super(pos, name)

  end

  def valid_positions 
    # add method to ensure we are not getting nil values in positions 
    #(relevant for comparing positions)
    moves = horizontal_dirs + diagonal_dirs
    moves_select(moves)
  end

end

q = Queen.new([0,4])

q.valid_positions