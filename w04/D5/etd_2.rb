require "byebug"
def my_min_slow(list)
  list.each do |el|
   my_boo = list.all? { |el2| el <= el2  }
  return el if my_boo
  end
end

def my_min_fast(list)
  min = list.first
  list.each {|el| min = el if el < min }
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_slow(list)  # =>  -5
# p my_min_fast(list)

def largest_contiguous_subsum_slow(list)
  subbas = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      subbas << list[i..j]
    end
  end
  subbas.map{|arr|arr.sum}.max
end

list = [2, 3, -6, 7, -6, 7]

def largest_contiguous_subsum_fast(list)
  final = list.first
  current_sum = 0
  list.each do |el|

    current_sum += el #2 5 -1 -6 1 
    if current_sum < 0
      current_sum = 0
    elsif current_sum > final
      final = current_sum # 5 1

    end

  end
  final
end


subsum_list = [5, 3, -7]
# p largest_contiguous_subsum_slow(subsum_list) # => 8
# p largest_contiguous_subsum_fast(subsum_list) # => 8
# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7


p largest_contiguous_subsum_fast(list) # => 8 (from [7, -6, 7])


# list.each do |el|
#   possible_max = el + max_sum
#   if possible_max > 0
#     max_sum = 0
#   elsif possible_max > max_sum
#     debugger
#     max_sum = possible_max
#     final_max = possible_max
#   else
#     max_sum = possible_max
  # end

  # puts "start -----------"
  # p list
  # puts "final " + final.to_s
  # puts "current_sum  " + current_sum.to_s
  # puts "current_sum " +  current_sum.to_s
  # puts "end ------------"
  # puts 