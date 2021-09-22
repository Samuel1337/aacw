require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)


  end



end

b = Board.new
d = Display.new(b)
p d