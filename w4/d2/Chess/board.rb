class Board

  def initialize
    @rows = Array.new(8){Array.new(8)}
  end

  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        if (0..1).include?(row) || (6..7).include?(row)
          @rows[row][col] = Piece.new([row,col])
          
        end
      end
    end
  end


end