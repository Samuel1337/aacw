class Piece

  attr_reader :name

  def initialize(pos, name="a")
    # @color = color
    # @board = board
    @pos = pos
    @name = name

  end

  def to_s
    self.name
  end


end