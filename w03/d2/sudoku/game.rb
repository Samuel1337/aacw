require_relative 'board.rb'

class Game
  # DEXES = [0,1,2,3,4,5,6,7,8]
  # VALS = [1,2,3,4,5,6,7,8,9]
  attr_accessor :board
  def initialize
    @board = Board.new('puzzles/sudoku1.txt')
  end

  def play
    until @board.solved?
      system("clear")
      @board.render
      pos = get_coord
      val = get_val
      if !@board.update_value(pos, val)
        puts "your attempt had an error, try again"
        sleep(2)
      end
    end
    system("clear")
    @board.render
    return "##WinnerWinner Chicken DINNER!!##"
  end

  def get_coord
    puts "enter the cooridnate without a comma, for example [0,0] would be 00"
    pos = gets.chomp
    final_pos = pos.split("").map!{|el| el.to_i}
    until final_pos.length == 2
      puts "stop fucking around, and enter 2 valid numbers"
      pos = gets.chomp
      final_pos = pos.split("").map!{|el| el.to_i}
    end

    return final_pos
  end

  def get_val
    puts "enter the value for the above position"
    val = gets.chomp
    return val
  end

end