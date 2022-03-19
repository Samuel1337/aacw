def first_anagram?(string1, string2) #factorial b/c perms
  ana1 = anagram_maker(string1)
  ana1.include?(string2)
end

def anagram_maker(str)
  arr = str.split("")
  perms = arr.permutation.to_a
  anagrams = perms.map {|arr| arr.join("")  }
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(string1, string2) #poly b/c nested loop
  arr1 = string1.split("")
  arr2 = string2.split("")

  arr1.each do |char|
    dex = arr2.index(char)
    arr2.delete_at(dex) if dex != nil 
  end
  arr2.join.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(string1, string2) #O(n2) b/c quick sort
  string1.chars.sort_by(&:downcase).join == string2.chars.sort_by(&:downcase).join
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(string1, string2) #O(n) b/c hashes have a n(1) look up time and we only looped thorugh each string once
  hash = Hash.new(0)
  string1.each_char {|char| hash[char] += 1 }
  string2.each_char {|char| hash[char] -= 1 }
  hash.values.all?{|val| val == 0 }
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true




# require 'benchmark'

# n = 5000000
# Benchmark.bm do |x|
#   x.report { for i in 1..n; a = "1"; end }
#   x.report { n.times do   ; a = "1"; end }
#   x.report { 1.upto(n) do ; a = "1"; end }
# end
