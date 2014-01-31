# If we list all the natural numbers below 10 that are multiples of
# 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
#
# My Notes:
# - Use sets to avoid indexing elements
# - Set's union method functions as set-theoretic union

require 'set'

def sum_mults_upto_limit(x, y, limit)
  set1 = Set.new((0..limit).step(x))
  set2 = Set.new((0..limit).step(y))
  set1.union(set2).reduce(:+)
end  

puts sum_mults_upto_limit(3, 5, 999)