require "byebug"
class Array
  def my_uniq
    arr = []
    self.each {|el| arr << el if !arr.include?(el)  }
    arr
  end

  def two_sum
    dexes = []
    self.each_with_index do |num1, i|
      self.each_with_index do |num2, j|
        dexes << [i,j] if num1 + num2 == 0 && i != j && !dexes.include?([j,i])


      end
    end
    dexes
  end

  def my_transpose
    arr = []
    self.each_with_index do |row, i|
      new_row = []
      row.each_with_index do |_var, j|
        new_row << self[j][i]
      end
      arr << new_row
    end
    arr
  end

  def stock_picker
    days = []
    current_max_profit = 0
    (0...self.length).each do |i|
      (i+1...self.length).each do | j|
        buy = self[i]
        sell = self[j]
        # debugger
        profit = sell - buy
        if profit > current_max_profit
          days = [i,j]
          current_max_profit = profit
        end
      end
    end
    days
  end
end
