class KnightPathFinder
  attr_reader :root_node

  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = []
  end 

  def build_move_tree
  end 

  def self.valid_moves(position)
    
  end 
end 