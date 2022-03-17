require_relative "piece.rb"
require "singleton"
require 'byebug'

class Pawn < Piece
  def initialize(pos, board, color)
    super
    @symbol = "♙"
  end

  PAWN_MOVES = [[1,0], [1,1], [1,-1]]

  def moves
    pos = self.pos
    valids = []
    row2, col2 = pos
    PAWN_MOVES.each do |positions|
      row1, col1 = positions
     
      temp_pos = [row1 + row2, col1 + col2]
      temp_row, temp_col = temp_pos
      valids << temp_pos 

    end
    valids.delete_if do |move|
        row, col = move
        row >= 8 || col >= 8 || row < 0 || col < 0  
      end
    valids
  end
end