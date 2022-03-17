class Game
  attr_accessor :board
  def initialize
    @board = [[4,3,2,1],[],[]]
  end

  def get_move
    puts "From which row take yee yon token?"
    take = gets.to_i
    puts "where you gonna put it?"
    put = gets.to_i
    [take, put]

  end

  def move(arr)
    take, put = arr
    piece = @board[take].pop
    @board[put].push(piece)
  end

  def won?
    return true if board == [[], [], [4,3,2,1]]
    false
  end

  def render
    puts "-------------------"
    @board.each_with_index { |row, i| puts "[#{i}] " + row.join(" ") }
    puts "-------------------"
  end

end
# g = Game.new

# until g.won?
#   system("clear")
#   g.render
#   g.move(g.get_move)
# end

# puts "you win!"