require_relative "slidable"
require_relative 'piece'
# require_relative "../board.rb"

class Queen < Piece
  include Slidable

  def initialize(pos, board, name="Q")
    super(pos, board, name="Q")

  end

  def valid_positions 

    moves = horizontal_dirs + diagonal_dirs
    moves_select(moves)
  end

end
# b = Board.new
# q = Queen.new([0,4], b)

# q.valid_positions