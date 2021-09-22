require_relative "rook"
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "queen"
require_relative "pawn"
require_relative "piece"
# require_relative "null_piece"
require 'byebug'
class Board

  # PIECES_LOCATIONS = { "R" => [[0,0], [0,7]]}

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

  PIECES_LOCATIONS = { [0,0] => Rook.new([0,0]), [0,1] => Knight.new([0,1]), [0,2] => Bishop.new([0,2]),  [0,3] => King.new([0,3]), [0,4] => Queen.new([0,4]), [0,5] => Bishop.new([0,5]), [0,6] => Knight.new([0,6]), [0,7] => Rook.new([0,7]) }

  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        if (0..1).include?(row) || (6..7).include?(row)
          temp_pos = [row, col]
          if PIECES_LOCATIONS.keys.include?(temp_pos)
            # debugger
            @rows[row][col] = PIECES_LOCATIONS[temp_pos]
          else
            @rows[row][col] = Piece.new(temp_pos)
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
    raise "invalid move" if self[start_pos] == "_"
    self[end_pos] = self[start_pos]
    self[start_pos].pos = end_pos
    self[start_pos] = "_"
  end

end

b = Board.new
b.render
# b.move_piece([0,0], [4,4])
# b.render
# b.move_piece([3,3], [3,2])