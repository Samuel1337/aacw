require_relative "piece.rb"


class Knight < Piece
  KNIGHT_MOVES = [[1,2], [2,1], [-1,2], [2,-1], [-2,1], [1,-2], [-1,-2], [-2,-1]]
  def initialize(pos, board, color)
    super
    @symbol = "♘"
  end

  def moves
    pos = self.pos
    valids = []

    KNIGHT_MOVES.each do |positions|
      row1, col1 = positions
      row2, col2 = pos
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

class King < Piece
  KING_MOVES = [[1,0], [0,1], [-1,0], [0,-1]]
  def initialize(pos, board, color)
    super
    @symbol = "♔"
  end

  def moves
    pos = self.pos
    valids = []

    KING_MOVES.each do |positions|
      row1, col1 = positions
      row2, col2 = pos
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

# k = King.new(1,1,1)
# p k