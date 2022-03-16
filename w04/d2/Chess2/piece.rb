class Piece
  attr_reader :pos, :symbol
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def to_s
    self.symbol
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end



end