require_relative "piece.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"
require_relative "stepable.rb"
require_relative "slideable.rb"
require "colorize"

class Board
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    populate
  end

  def populate

    pieces_locations = {
     [0,0] => Rook.new([0,0], self, :white), [0,1] => Knight.new([0,1], self, :white), [0,2] => Bishop.new([0,2], self, :white),  [0,3] => King.new([0,3], self, :white), [0,4] => Queen.new([0,4], self, :white), [0,5] => Bishop.new([0,5], self, :white), [0,6] => Knight.new([0,6], self, :white), [0,7] => Rook.new([0,7], self, :white),

     [7,0] => Rook.new([7,0], self, :magenta), [7,1] => Knight.new([7,1], self, :magenta), [7,2] => Bishop.new([7,2], self, :magenta),  [7,3] => Queen.new([7,3], self, :magenta), [7,4] => King.new([7,4], self, :magenta), [7,5] => Bishop.new([7,5], self, :magenta), [7,6] => Knight.new([7,6], self, :magenta), [7,7] => Rook.new([7,7], self, :magenta)  
    }

    (0..7).each do |row|
      (0..7).each do |col|
        if (0..1).include?(row) || (6..7).include?(row)
          temp_pos = [row, col]
          if pieces_locations.keys.include?(temp_pos)
            @grid[row][col] = pieces_locations[temp_pos]
          elsif 
            row == 1
            # debugger
            @grid[row][col] = Pawn.new(temp_pos, self, :white)
          else
            @grid[row][col] = Pawn.new(temp_pos, self, :magenta)
          end
        end
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

  def move_piece(color, start_pos, end_pos)
    raise "not a piece" if self[start_pos].symbol == " "
    raise "don't be greedy, that's not your piece" if self[start_pos].color != color
    raise "not a valid move" if !self[start_pos].valid_moves.include?(end_pos)
    self[end_pos] = NullPiece.instance if self[end_pos].color != color

    if self[end_pos].symbol == " "
      assign_pos(self[start_pos], end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end

  def assign_pos(piece, position)
    piece.pos = position
  end
  
  def render
    puts "  -------   "
    @grid.each do |row|
      puts row.join(" ")
    end
    puts "   "
  end

  def in_check?(color)
    king = grid.flatten.select {|piece| piece.symbol ==  "♔" && piece.color == color }
    king
  end
end

b = Board.new

p b.in_check?(:white)






# b = Board.new
# b.render
# b.move_piece(:white, [1,0],[2,0])

# # p b[[2,0]]
# b.render
# b.move_piece(:white, [2,0],[3,0])

# b.move_piece(:white, [3,0],[4,0])
# b.render

# # should return error
# b.move_piece(:white, [1,0],[2,0])
# b.render
# b.move_piece(:white, [1,1],[2,0])
# b.render
# # p b



# p b[[0,0]].moves
# p b[[0,1]].moves
# p b[[0,2]].moves
# p b[[0,3]].moves
# p b[[0,4]].moves
# p b[[1,4]].moves

# 
# b.render