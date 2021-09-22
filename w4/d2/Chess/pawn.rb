require_relative 'piece'

class Pawn < Piece

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

  end


  
  # forward direction method that reads color and returns 1 or -1
  # forward steps ?? what does it do?
  # possible moves
  # side attacks return possible side attacks from pos


end