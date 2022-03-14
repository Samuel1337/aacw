require 'byebug'
require_relative "tree_node.rb"
class Kpf
  attr_reader :root_node
  KNIGHT_MOVES = [[1,2], [2,1], [-1,2], [2,-1], [-2,1], [1,-2], [-1,-2], [-2,-1]]

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    @start_pos = pos
    build_move_tree
  end

  def self.valid_moves(pos)
    valids = []

    KNIGHT_MOVES.each do |positions|
      row1, col1 = positions
      row2, col2 = pos
      temp_pos = [row1 + row2, col1 + col2]
      temp_row, temp_col = temp_pos
      valids << temp_pos 
    end

    valids
  end

  def new_move_positions(pos)
    moves = Kpf.valid_moves(pos)
    moves.delete_if do |move|
      row, col = move
      @considered_positions.include?(move) || row >= 8 || col >= 8 || row < 0 || col < 0  
    end
    moves -= @considered_positions
    @considered_positions += moves
    moves
  end


  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      current = queue.shift
      new_move_positions(current.value).each do |val|
        node = PolyTreeNode.new(val)
        current.add_child(node)
        queue << node
      end
    end
  end
# -------- Phase 2 --------
  def find_path(end_pos)
    end_node = @root_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = [] 

    temp = end_node
    until temp == nil
      path.unshift(temp.value)
      temp = temp.parent
    end

    p path


  end
end