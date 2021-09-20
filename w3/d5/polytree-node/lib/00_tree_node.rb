require 'byebug'
class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value=nil)
    @value = value
    @parent = nil
    @children = []
  end 

  def parent=(new_parent)
    # before reassigning parent, @parent => old_parent 
    
    @parent.children
    
    @parent = new_parent
    if !@parent.children.include?(self)
      # debugger
      @parent.children << self
      # var = self.children.index(self)
      # self.children.delete_at(var)

    end

    

  end

  def add_child
  end

  def remove_child
  end

  def dfs
  end

  def bfs
  end



end