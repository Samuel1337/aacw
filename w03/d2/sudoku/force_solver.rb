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
    i = 0
    j = 0
    until @board[i][j].given == false
      i += 1
    end
    queue = [@board[i][j]]



  end
  def form_q
   
    (0..8).each do |i| 
      (0..8).each do |j|
        pos = [i,j]
        tile = @board[pos]
        queue << [tile, pos] if tile.given == false 
      end 
    end
    queue
  end

  def cute
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
  end
end



