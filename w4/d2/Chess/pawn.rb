require_relative 'piece'
require "byebug"

class Pawn < Piece

  attr_reader

  def initialize(pos, name = "p")
    super(pos, name)

  end

  def first_row? # boolean for first row
    if self.color == :black
      true if pos[0] == 1
    elsif self.color == :white
      true if pos[0] == 6
    end
    false
  end

  def forward_direction
    if self.color == :black
      1 
    else
      -1
    end
  end

  def side_attacks #imagine (1,1)
    attacks = []
    row, col = pos
    attacks << [(row + forward_direction),  (col + forward_direction)]
    attacks << [(row + forward_direction),  (col - forward_direction)]
    #eliminate if there is no enemy
    attacks
  end

  def possible_moves
    row, col = pos
    moves = [[(row + forward_direction), col]]
    if (row == 1 && self.color == :black) || (row == 6 && self.color == :white)
      moves += [[(row + forward_direction + forward_direction), col]]
    end
    moves.concat(side_attacks)
  end


end

