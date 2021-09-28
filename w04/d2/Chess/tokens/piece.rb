# require_relative "rook"
# require_relative "bishop"
# require_relative "king"
# require_relative "knight"
# require_relative "queen"
# require_relative "pawn"
# require_relative "null_piece"
# require_relative "../board.rb"
require 'byebug'
class Piece
  attr_accessor :pos
  attr_reader :name, :color, :board

  def initialize(pos, board, name="a")
    @board = board
    @pos = pos
    @name = name
    assign_color(pos)
  end

  def assign_color(pos)
    row = pos[0]
    if (0..1).include?(row)
      @color = :black
    elsif (6..7).include?(row)
      @color = :white
    else
      @color = :none
    end

  end

  def to_s
    self.name
  end

  def is_null?
    self.is_a?(NullPiece)
  end

  def ally_space?(pos)
    self.color == self[pos].color
  end

  def[](pos)
    row, col = pos
    @board.rows[row][col]
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