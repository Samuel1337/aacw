module Slideable
  DIAGONAL_DIRS = [[1,1], [-1,-1], [-1,1], [1,-1]]
  HORIZONTAL_DIRS = [[-1,0], [0,-1], [0,1], [1,0]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end
  
  def moves
    positions = []
    x1, y1 = self.pos
    move_dirs.each do |deltas|
    x2, y2 = deltas
    positions << [x1+x2, y1+y2]
    ## you are here!!
      
    end
  end
end

class Bishop < Piece
  include Slideable
  def initialize(pos, board, color)
    super
    @symbol = :B
  end
end

class Rook < Piece
  include Slideable
  def initialize(pos, board, color)
    super
    @symbol = :R
  end
end

class Queen < Piece
  include Slideable
  def initialize(pos, board, color)
    super
    @symbol = :Q
  end
end