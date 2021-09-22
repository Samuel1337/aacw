require_relative "rook"
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "queen"
require_relative "pawn"
require_relative "piece"
require_relative "null_piece"
require 'byebug'
class Board


  def initialize
    @rows = Array.new(8){Array.new(8, NullPiece.instance)}
    populate
  end

  def render
    puts "      "
    @rows.each do |row|
      puts row.join(" ")
    end
    puts "      "
  end

  PIECES_LOCATIONS = {
     [0,0] => Rook.new([0,0]), [0,1] => Knight.new([0,1]), [0,2] => Bishop.new([0,2]),  [0,3] => King.new([0,3]), [0,4] => Queen.new([0,4]), [0,5] => Bishop.new([0,5]), [0,6] => Knight.new([0,6]), [0,7] => Rook.new([0,7]),

     [7,0] => Rook.new([7,0]), [7,1] => Knight.new([7,1]), [7,2] => Bishop.new([7,2]),  [7,3] => Queen.new([7,3]), [7,4] => King.new([7,4]), [7,5] => Bishop.new([7,5]), [7,6] => Knight.new([7,6]), [7,7] => Rook.new([7,7])  
}

  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        if (0..1).include?(row) || (6..7).include?(row)
          temp_pos = [row, col]
          if PIECES_LOCATIONS.keys.include?(temp_pos)
            @rows[row][col] = PIECES_LOCATIONS[temp_pos]
          else
            @rows[row][col] = Pawn.new(temp_pos)
          end
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
    raise "invalid move" if self[start_pos].is_null?
    moving_piece = self[start_pos]
    new_location = self[end_pos]


    self[end_pos] = self[start_pos]
    self[start_pos].pos = end_pos
    self[start_pos] = new_location
  end

end

b = Board.new
b.render

p b[[0,0]]
p b[[1,1]]
b.move_piece([0,0], [4,4])
b.render
p b[[0,0]]
b.move_piece([3,3], [3,2])

