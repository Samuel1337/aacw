require 'byebug'
require_relative "tree_node.rb"
class KnightPathFinder
  attr_reader :root_node, :start_pos
  KNIGHT_MOVES = [[1,2], [2,1], [-1,2], [2,-1], [-2,1], [1,-2], [-1,-2], [-2,-1]]

  def initialize(pos)
    @start_pos = pos
    @considered_positions = [pos]
    @root_node = PolyTreeNode.new(@start_pos)

    build_move_tree
  end 

  def self.valid_moves(position) #if [2,2] this should return an array of length 8, that hass all the sums of @@knight moves added to positon
    # return false if @considered_positions.include?(position)
    moves = KNIGHT_MOVES.map do |pos| 
      left = pos[0] + position[0] 
      right = pos[1] + position[1]
      [left, right]
    end

    moves.select do |pos|
      row, col = pos
      check_row = (row <= 7 && row >= 0)
      check_col = (col <= 7 && col >= 0)
      check_col && check_row
    end
  end 

  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos) - @considered_positions
    @considered_positions += possible_moves
    possible_moves
  end

  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      current = queue.shift
      new_move_positions(current.value).each do |el|
        node = PolyTreeNode.new(el)
        current.add_child(node)
        queue << node
      end
    end
  end
  
  def find_path(destination)
    end_node = @root_node.bfs(destination)
    var = trace_path(end_node)
    var.map(&:value).reverse

  end

  
  def trace_path(end_node)
    path = []

    current = end_node
    until current == nil
      path << current
      current = current.parent
    end
    path


  end





  k = KnightPathFinder.new([0,0])
  p k.find_path([2,6])


end 

