require 'byebug'
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

  def moves_select(moves)
    # debugger
    moves.select do |pos|
      row, col = pos
      check_row = (row <= 7 && row >= 0)
      check_col = (col <= 7 && col >= 0)
      check_col && check_row
    end
  end


end


# q = Queen.new([0,4])