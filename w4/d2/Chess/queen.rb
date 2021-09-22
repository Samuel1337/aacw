require_relative "slidable"
require_relative 'piece'

class Queen < Piece
  include Slidable
end