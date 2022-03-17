require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'
# require 'byebug'


class Display
    attr_reader :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0], board) #cursor.cursor_pos
    @board = board
  end

  def render
    system("clear")
    puts "        "
      @board.grid.each_with_index do |row, i|
        row.each_with_index do |square, j| 
          if [i, j] == @cursor.cursor_pos
            print " #{square.symbol} ".yellow.on_light_black
          else
            if (i + j).even?
                print " #{square.symbol} ".on_light_magenta
            elsif (i + j).odd?
                print " #{square.symbol} ".on_white
            end
          end
          
        end
        puts
    end
    puts "       "
  end

end

d = Display.new(Board.new)

i = 1
d.render
until i == 10
    
d.cursor.get_input
d.render
end