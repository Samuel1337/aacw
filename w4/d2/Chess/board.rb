require_relative "./tokens/rook"
require_relative "./tokens/bishop"
require_relative "./tokens/king"
require_relative "./tokens/knight"
require_relative "./tokens/queen"
require_relative "./tokens/pawn"
require_relative "./tokens/piece"
require_relative "./tokens/null_piece"
# require 'byebug'
class Board

  attr_reader :rows

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

  

  def populate

    pieces_locations = {
     [0,0] => Rook.new([0,0], self), [0,1] => Knight.new([0,1], self), [0,2] => Bishop.new([0,2], self),  [0,3] => King.new([0,3], self), [0,4] => Queen.new([0,4], self), [0,5] => Bishop.new([0,5], self), [0,6] => Knight.new([0,6], self), [0,7] => Rook.new([0,7], self),

     [7,0] => Rook.new([7,0], self), [7,1] => Knight.new([7,1], self), [7,2] => Bishop.new([7,2], self),  [7,3] => Queen.new([7,3], self), [7,4] => King.new([7,4], self), [7,5] => Bishop.new([7,5], self), [7,6] => Knight.new([7,6], self), [7,7] => Rook.new([7,7], self)  
    }

    (0..7).each do |row|
      (0..7).each do |col|
        if (0..1).include?(row) || (6..7).include?(row)
          temp_pos = [row, col]
          if pieces_locations.keys.include?(temp_pos)
            @rows[row][col] = pieces_locations[temp_pos]
          else
            # debugger
            @rows[row][col] = Pawn.new(temp_pos, self)
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
p b[[0,1]].valid_moves
sleep(2)
b.move_piece([0,1], [0,5])
b.render
# p b[[0,4]]
# p b[[2,1]].valid_moves
# b.render

# p 
# p b[[1,1]]
# b.render
# p b[[0,0]]
# b.move_piece([3,3], [3,2])


