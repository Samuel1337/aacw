def range(start, finish)
  arr = []

  return arr if finish <= start
  arr << start

  arr + range(start + 1, finish)
end

# p range(1, 15)
# p range(11, 5)

def it_range(start, finish)
  arr = [  ]
  until finish <= start
    arr << start
    start += 1
  end 
  arr
end

# p it_range(1, 15)
# p it_range(11, 5)

def exponentiation(b, n)
  return 1 if n == 0
  return b if n == 1
  b *exponentiation(b, n-1)
end

# p exponentiation(2, 8)
# p exponentiation(2, 0)

def flatten(arr)
  new_array = []
  arr.each do |el|
    if el.is_a?(Array)
      new_array += flatten(el)
    else
      new_array.push(el)
    end
  end

  new_array
end

# p flatten([1, [2], [3, [4]]])
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# p flatten(robot_parts)

def deep_dup(arr)
  new_array = []
  arr.each do |el|
    if el.is_a?(Array)
      new_array += [deep_dup(el)]
    else
      new_array.push(el.dup)
    end
  end

  new_array
end
# num_arr = [1, [2], [3, [4]]]
# num_dup =  deep_dup(num_arr)
# num_arr[2][0] = "butts"
# p num_dup
# p num_arr

def rec_fibo(n)
  return [1] if n == 1
  return [1,1] if n == 2
  prev = rec_fibo(n - 1)

  prev += [prev[-1] + prev[-2]]

end

# p rec_fibo(3)
# p rec_fibo(4)
# p rec_fibo(5)
# p rec_fibo(6)

def reg_fibo(n)
  arr = [1, 1]
  return "no, dummies" if n <= 0
  return arr[0...n] if n <=2

  until arr.length == n
    arr << arr[-1] + arr[-2]
  end
  arr
end

# p reg_fibo(0)
# p reg_fibo(1)
# p reg_fibo(2)
# p reg_fibo(3)
# p reg_fibo(4)
# p reg_fibo(5)
# p reg_fibo(6)

def bsearch(arr, target)
  loc = arr.length/2
  left = arr.drop(loc + 1)
  right = arr.take(loc )
  return nil if arr.empty?

  case arr[loc] <=> target
  when 0
    loc
  when 1
    bsearch(right, target) 
  when -1
   suba = bsearch(left, target) 
   if suba == nil
    return nil
   else
    return suba + loc + 1
   end
  end


end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)
  return arr if arr.length <= 1 
  loc = arr.length/2

  right = arr.drop(loc)
  left = arr.take(loc)

  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left, sorted_right)
  
end

def merge(arr1, arr2)
  final = []
  until arr1.empty? || arr2.empty?
    case arr1.first <=> arr2.first
    when 0
      final << arr1.shift
      final << arr2.shift
    when 1
      final << arr2.shift
    when -1
      final << arr1.shift
    end
  end
  final + arr1 + arr2
end

# p merge([1,5, 9], [2,3,4,6,7,8,9])
# p merge_sort([4,7,1,9,8,7])

def subsets(arr)
  return [[]] if arr.empty?
  abriviated = arr.take(arr.length - 1)
  subz = subsets(abriviated)
  subz += ( subz.map { |subba| subba + [arr.last] } )
end

# p subsets([1, 2, 3])

def permutations(arr)
  return [arr] if arr.length <= 1
  first = arr.shift
  perms = permutations(arr)
  final = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      final << perm[0...i] + [first] + perm[i..-1]
    end
  end


  final
end

# p permutations([1, 2])

# def make_change(amount)
#   denomonations = [25, 10, 5, 1]
#   change = []

#   denomonations.each do |coin|
#     lacking = amount - change.sum
#     until lacking < coin
#       change << coin
#       lacking = amount - change.sum
#     end
#   end
#   change
# end

#  p make_change(66)

def make_rec_change(amount, denomonations = [25, 10, 5, 1])
  return [] if denomonations.empty?
  return nil if amount == 0
  change = []
  remainder = amount - change.sum
  until denomonations.first > remainder
    change << denomonations.first
    remainder = amount - change.sum
  end

  rest = make_rec_change(remainder, denomonations[
    1..-1])

  change += rest
  change
  

end


p make_rec_change(66)