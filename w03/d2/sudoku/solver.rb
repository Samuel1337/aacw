require_relative 'board.rb'

class Solver
  DEXES = [0,1,2,3,4,5,6,7,8]
  VALS = [1,2,3,4,5,6,7,8,9]

  def initialize
    @board = Board.new('puzzles/sudoku1.txt')
  end

  def posibilities(pos)
    arr = []
    (1..9).each do |num|
      arr << num if !all_vals(pos).include?(num)
    end
    arr
  end

  def solve
    attempts = 0
    queue = form_q
    system "clear"
    @board.render
    puts "here we go!"
    sleep(3)
    system "clear"
    puts "boop"
    sleep(1)
    puts "..."
    sleep(1)    
    puts "beep"
    sleep(1)
    puts "..."
    

    until queue.empty?
      attempts += 1
      item = queue.shift
      tile = item.first
      pos = item.last
      all_options = posibilities(pos)
      if all_options.length == 1
        tile.value = all_options.first
      else
        queue << item
      end
    end
    @board.render
    puts "DONE in #{attempts} thoughts"


  end

  def all_vals(pos)
    horizontal_vals(pos) + vertical_vals(pos)+ square_vals(pos)
  end

  def horizontal_vals(pos)
    row, col = pos
    horiz_vals = []

    DEXES.each do |cols|
      pos = [row, cols] 
      val = @board[pos].value.to_i
      horiz_vals << val if val !=0
    end
    horiz_vals
  end


  def vertical_vals(pos)
    row, col = pos
    vert_vals = []

    DEXES.each do |rows|
      pos = [rows, col] 
      val = @board[pos].value.to_i
      vert_vals << val if val !=0
    end
    vert_vals
  end
  def square_vals(pos)
    x = 0
    y = 0
    square_dexes = []
    3.times do
      3.times do
        three_by_array = []
        (0...3).each do |i|
          (0...3).each do |j|
            three_by_array << [i + x, y + j]
          end
        end
        square_dexes = three_by_array if three_by_array.include?(pos)
        x += 3
      end
      x = 0
      y += 3
    end

    square_vals = []
    square_dexes.each do |pos| 
      val = @board[pos].value.to_i
      square_vals << val if val != 0
    end
    square_vals
  end

  def form_q
    queue = []
    (0..8).each do |i| 
      (0..8).each do |j|
        pos = [i,j]
        tile = @board[pos]
        queue << [tile, pos] if tile.given == false 
      end 
    end
    queue
  end
end



