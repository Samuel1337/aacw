require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'
require 'byebug'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board

  end

  def render
    puts "      "
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |square, j|

        if (i + j).even? && square.color == :black
          print " #{square.name} ".black.on_blue
        elsif (i + j).even? && square.color == :white
          print " #{square.name} ".white.on_blue
        elsif (i + j).odd? && square.color == :black
          print " #{square.name} ".black.on_light_magenta
        elsif (i + j).odd? && square.color == :white
          print " #{square.name} ".white.on_light_magenta
        elsif (i + j).odd? && square.color == :none
          print "   ".on_light_magenta
        elsif (i + j).even? && square.color == :none
          print "   ".on_blue
        end

   
     
      
      end
      puts
    end
    puts "      "
  end


end
# system("clear")
b = Board.new
d = Display.new(b)
d.render
# sleep(2)
# system("clear")
b.move_piece([0,0], [4,4])
d.render

p b[[4,0]]

