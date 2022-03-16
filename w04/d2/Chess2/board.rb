require_relative "piece.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"
require_relative "stepable.rb"
require_relative "slideable.rb"
class Board
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    populate
  end

  def populate
    pieces_locations = {
    [0,0] => Rook.new([0,0], self), [0,1] => Knight.new([0,1], self), [0,2] => Bishop.new([0,2], self),  [0,3] => King.new([0,3], self), [0,4] => Queen.new([0,4], self), [0,5] => Bishop.new([0,5], self), [0,6] => Knight.new([0,6], self), [0,7] => Rook.new([0,7], self),

    [7,0] => Rook.new([7,0], self), [7,1] => Knight.new([7,1], self), [7,2] => Bishop.new([7,2], self),  [7,3] => Queen.new([7,3], self), [7,4] => King.new([7,4], self), [7,5] => Bishop.new([7,5], self), [7,6] => Knight.new([7,6], self), [7,7] => Rook.new([7,7], self)  
    }
    @grid.each_with_index do |row, i|
      row.each_with_index do |square, j|
        @grid[i][j] = Pawn.new([i,j], self, :red) if i == 1 || i == 6 
        @grid[i][j] = Piece.new([i,j], self, :red) if i == 0 || i == 7
      end
    end
  end

  def[](pos)
    row, col = pos
    @grid[row][col]
  end

  def[]=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "not a piece" if self[start_pos] == nil
    raise "That seat's taken" if self[end_pos] != nil

  end

  
#   def render
#     puts "      "
#     @grid.each do |row|
#       puts row.join(" ")
#     end
#     puts "      "
#   end

end