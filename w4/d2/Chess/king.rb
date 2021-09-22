require_relative 'stepable'
require_relative 'piece'

class King < Piece
include Stepable
  KING_MOVES = [[1,0], [0,1], [-1,0], [0,-1], [-1,1], [1,-1], [-1,-1], [1,1]]

  def initialize(pos, name="K")
    super(pos, name)

  end

  def valid_moves
    position = self.pos
    moves = KING_MOVES.map do |pos| 
      left = pos[0] + position[0] 
      right = pos[1] + position[1]
      [left, right]
    end

    moves.select do |pos|
      row, col = pos
      check_row = (row <= 7 && row >= 0)
      check_col = (col <= 7 && col >= 0)
      check_col && check_row
    end
  end 
end