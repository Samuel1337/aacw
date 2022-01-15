require_relative 'tile.rb'
require 'byebug'
class Board
  FULL = [1,2,3,4,5,6,7,8,9]
  attr_reader :grid
  def initialize(filename)
    @grid = load_file(filename)
  end


  def load_file(filename)
    grid = []
    File.open(filename).each_line do |line|
      row = []
      line.split("").each do |char|
        row << Tile.new(char) if char != "\n"
      end
      grid << row
    end
    grid
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def update_value(pos, val)
    if self[pos].given == false
      self[pos].value = val
      return true
    end
    false
  end

  def render
    i = 0
    puts "#########################".yellow
    @grid.each do |row|
      j = 0
      print "# ".yellow
      row.each do |char|
        j += 1
        
        print char 
        print " "
        print "| ".yellow if j == 3 || j == 6
        
      end
      print "#".yellow
      puts
      i += 1
      puts "# --------------------- #".yellow if i == 3 || i == 6
        
    end
    puts "#########################".yellow
  end

  def solved?
    horizontal?(@grid.transpose) && horizontal?(@grid) && three_by_three?
  end

  def horizontal?(array)
    array.each do |row|
      row_arr = []
      row.each do |tile|
        row_arr << tile.value.to_i
      end
      return true if row_arr.sort == FULL
    end
    false
  end

  def three_by_three?
    x = 0
    y = 0
    3.times do
      3.times do
        three_by_array = []
        (0...3).each do |i|
          (0...3).each do |j|
            three_by_array << @grid[i + x][j + y].value.to_i
          end
        end
        return false if three_by_array.sort != FULL
        x += 3
      end
      x = 0
      y += 3
    end
    true
  end
end

