# If we list all the natural numbers below 10 that are multiples of
# 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'set'

def find_sum_of_mults(x, y, limit)
  set1 = Set.new((0..limit).step(3))
  set2 = Set.new((0..limit).step(5))
  set1.union(set2).reduce(:+)
end  

puts find_sum_of_mults(3, 5, 999)