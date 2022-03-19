def bad_two_sum?(arr, target) # poly b/c nested loop
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def ok_two_sum?(arr, target) #nlogn
  arr.each do |n1|
    arr.bsearch {|n2| n1 + n2 == target  }
  end

  arr.bsearch {|n2|  n2 == target  }
end

# p ok_two_sum?(arr, 7) # => should be true
# p ok_two_sum?(arr, 5) # => should be false

def good_two_sum?(arr, target) #linear
  hash = Hash.new(0)
  arr.each {|n|hash[n] += 1}
  arr.each do |n|
    return true if hash.any? do |k,v|
      if k != n && k.odd?
        k + n == target
      end
    end
  end
  false
end

# p good_two_sum?(arr, 6) # => should be true
# p good_two_sum?(arr, 10) # => should be false

ary = [0, 4, 7]
p ary.bsearch {|x| x >=   4 } #=> 4
p ary.bsearch {|x| x >=   6 } #=> 7
p ary.bsearch {|x| x >=  -1 } #=> 0
p ary.bsearch {|x| x >= 100 } #=> nil