require_relative "slidable"
require_relative 'piece'

class Queen < Piece
  include Slidable

  def initialize(pos, name="Q")
    super(pos, name)

  end

  def valid_positions # add method to ensure we are not getting nil values in positions (relevant for comparing positions)
    moves = horizontal_dirs + diagonal_dirs
    moves.select do |pos|
      row, col = pos
      check_row = (row <= 7 && row >= 0)
      check_col = (col <= 7 && col >= 0)
      check_col && check_row
    end
  end

end