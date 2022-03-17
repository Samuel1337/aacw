require_relative "piece.rb"
require 'byebug'

module Slideable
  DIAGONAL_DIRS = [[1,1], [-1,-1], [-1,1], [1,-1]]
  HORIZONTAL_DIRS = [[-1,0], [0,-1], [0,1], [1,0]]



  def moves
    positions_array = []
    move_dirs.each do |delta|
      positions_array += grow_unblocked_moves_in_dir(delta, pos)
    end
    positions_array
  end

  def grow_unblocked_moves_in_dir(delta, start_pos)
    new_position_array = []
    # test_position = start_pos
    x1, y1 = start_pos
    x2, y2 = delta
    test_position = [x1 + x2, y1 + y2]
    # debugger

    while !out_of_bounds?(test_position) && @board[test_position].symbol == " " 
    #   debugger
      new_position_array << test_position
      
      x1, y1 = test_position
      test_position = [x1 + x2, y1 + y2]
    end

    new_position_array.delete_if {|x,y| x<0 || y < 0 }

  end
end

class Bishop < Piece
  include Slideable
  def initialize(pos, board, color)
    super
    @symbol = "♗"
  end

  def move_dirs
    DIAGONAL_DIRS
  end
end

class Rook < Piece
  include Slideable
  def initialize(pos, board, color)
    super
    @symbol = "♖"
  end

  def move_dirs
    HORIZONTAL_DIRS
  end
end

class Queen < Piece
  include Slideable
  def initialize(pos, board, color)
    super
    @symbol = "♕"
  end

  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end
end

# q = Queen.new(1,1,1)
#