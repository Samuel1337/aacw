require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board

  end

  def render
    puts "      "
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        if (i + j).even?
          puts square.white.on_black
        else
          puts square.black.on_white
        end
      end
      puts
    end
    puts "      "
  end


end

b = Board.new
d = Display.new #(b)
d.render