require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  include Stepable
  KNIGHT_MOVES = [[1,2], [2,1], [-1,2], [2,-1], [-2,1], [1,-2], [-1,-2], [-2,-1]]

  def initialize(pos, board, name="N")
    super

  end

  def valid_moves
    position = self.pos
    moves = KNIGHT_MOVES.map do |pos| 
      left = pos[0] + position[0] 
      right = pos[1] + position[1]
      [left, right]
    end
    on_board_moves = moves_select(moves)
    on_board_moves.reject { |move| ally_space?(move) }
  end 
end