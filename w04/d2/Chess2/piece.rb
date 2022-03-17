
require "colorize"
class Piece
  attr_reader :pos, :symbol, :color
  attr_writer :pos
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def to_s
    self.symbol.colorize(color)
  end

  def empty?
  end

  def valid_moves
    moves
  end

  def pos=(val)
    @pos = val
  end

  
  def out_of_bounds?(pos)
    x, y = pos
    return true if x < 0 || x >= 8 || y < 0 || y >= 8 
    false
  end



end