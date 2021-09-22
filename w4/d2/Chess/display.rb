require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'
require 'byebug'

class Display

  attr_reader :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board) #cursor.cursor_pos
    @board = board

  end

  def render
    system("clear")
    puts "      "
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        if [i, j] == cursor.cursor_pos
          print " #{square.name} ".yellow.on_light_black
        else
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
      end
      puts
    end
    puts "      "
  end

  def test_loop
    self.render
    self.cursor.get_input
    self.render
    self.cursor.get_input
    self.render
    self.cursor.get_input
  end


end
# system("clear")
b = Board.new
d = Display.new(b)
d.test_loop

