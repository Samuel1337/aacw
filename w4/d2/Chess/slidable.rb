module Slidable



  def horizontal_dirs
    horizontals = []
    pos = self.pos #imagine position is [1,1]
    (0..7).each do |i|
      horizontals << [pos[0], i]
      horizontals << [i, pos[i]]

    end
    horizontals
  end

  def diagonal_dirs 
    diags = []
    pos = self.pos # [5, 3] []
    sum = pos.sum
    (0..7).each do |i|
      (0..7).each do |j|
        diags << [i, j] if (i + j == sum)
        diags << [i, j] if (i + pos[0] == j + pos[1] )
      end
    end
    diags
  end
 
end