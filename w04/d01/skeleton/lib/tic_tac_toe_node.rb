require_relative 'tic_tac_toe'
# require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return @board.won? && board.winner != evaluator if @board.over?
    # return false if @board.over? && board.winner == nil
  end

  def full_board?
  end

  def winning_node?(evaluator)
    return @board.won? && board.winner == evaluator if @board.over?
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # debugger
    moves = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        current_pos = [i, j]
        # p current_pos
        if board.empty?(current_pos)
          copy_of_board = @board.dup
          # p copy_of_board[pos]
          
          copy_of_board[current_pos]= @next_mover_mark
          if @next_mover_mark == :x
            next_mark_to_be = :o 
          else
            next_mark_to_be = :x
          end
          moves << TicTacToeNode.new(copy_of_board, next_mark_to_be, current_pos)
        end
      end
    end
    moves
  end
end
