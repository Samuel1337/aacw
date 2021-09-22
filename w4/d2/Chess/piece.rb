class Piece
  attr_accessor :pos
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

  # def valid_moves
  #   [pos.map{|el| el + 1}]
  # end

  def[](pos) 
    row, col = pos
    #@board[row][col]
  end


end