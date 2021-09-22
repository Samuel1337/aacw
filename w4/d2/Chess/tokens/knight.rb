require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  include Stepable
  KNIGHT_MOVES = [[1,2], [2,1], [-1,2], [2,-1], [-2,1], [1,-2], [-1,-2], [-2,-1]]

  def initialize(pos, name="N")
    super(pos, name)

  end

  def valid_moves
    position = self.pos
    moves = KNIGHT_MOVES.map do |pos| 
      left = pos[0] + position[0] 
      right = pos[1] + position[1]
      [left, right]
    end
    moves_select(moves)
  end 
end