require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  include Stepable

  def initialize(pos, name="K")
    super(pos, name)

  end
end