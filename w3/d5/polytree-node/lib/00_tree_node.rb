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
    if new_parent != nil 
      if @parent != nil
        @parent.children.delete(self)
      end
      @parent = new_parent
      @parent.children << self
    elsif @parent != nil
      @parent.children.delete(self)
      @parent = nil
    end
  end

  def add_child(child)
    child.parent = self if child.parent != self 
  end

  def remove_child(child)
    raise if !child.parent.children.include?(child)
    child.parent = nil
  end

  def dfs
  end

  def bfs
  end



end