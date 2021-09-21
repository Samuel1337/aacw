require_relative "00_tree_node.rb"
class KnightPathFinder
  attr_reader :root_node
  KNIGHT_MOVES = [[1,2], [2,1], [-1,2], [2,-1], [-2,1], [1,-2], [-1,-2], [-2,-1]]

  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = []
  end 

  def build_move_tree
  end 
  
  def self.valid_moves(position) #if [2,2] this should return an array of length 8, that hass all the sums of @@knight moves added to positon
    # return false if @considered_positions.include?(position)
    moves = KNIGHT_MOVES.map do |pos| 
      left = pos[0] + position[0] 
      right = pos[1] + position[1]
      [left, right]
    end

    moves.select do |pos|
      ps = row, col
      check_row = row =< 7 && row >= 0
      check_col = col =< 7 && col >= 0
      check_col && check_row
    end
  end 

  def new_move_positions(position)
    return false if !KnightPathFinder.valid_moves(position) #return an array
    @considered_positions << position

  end

end 