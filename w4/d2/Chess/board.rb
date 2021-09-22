require_relative "piece"
require 'byebug'
class Board

  def initialize
    @rows = Array.new(8){Array.new(8, "_")}
    populate
  end

  def render
    puts "      "
    @rows.each do |row|
      puts row.join(" ")
    end
    puts "      "
  end

  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        if (0..1).include?(row) || (6..7).include?(row)
          @rows[row][col] = Piece.new([row,col])
          
        end
      end
    end
  end

  def[](pos)
    row, col = pos
    @rows[row][col]
  end

  def[]=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "invalid move" if self[start_pos] == "_"
    self[end_pos] = self[start_pos]
    self[start_pos].pos = end_pos
    self[start_pos] = "_"
  end

end

b = Board.new
b.render
b.move_piece([0,0], [4,4])
b.render
b.move_piece([3,3], [3,2])