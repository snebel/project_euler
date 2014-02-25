# It is possible to write five as a sum in exactly six different ways:
#
# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1
#
# How many different ways can one hundred be written as a sum of at least
# two positive integers?
#
# My Notes: 
# - For a number n, there are n/2 different pairs of numbers summing to n
# - So to find the number of triples summing to n, for each number below n,
#   x, we can take all the pairs summing to (n-x) and form (n-x)/2
#   triples summing to 100.  Then we can find the total number of triples
#   by summing the result of this formula for every x below 100.
# - 

def num_triples(n)
  (1..n/3).map {|x| (n-x)/2 }.reduce(:+)
end
# 5
# 1 1,3
# 1 2,2
# 2 1,2
# 3 1,1
#
# 6
# 1 1,4
# 1 2,3
# 2 1,3
# 2 2,2
#
# 10
# 1 1,8
# 1 2,7
# 1 3,6
# 1 4,5
# 2 *1,7
# 2 2,6
# 2 3,5
# 2 4,4
# 3 *1,6
# 3 *2,5
# 3 3,4
# 4 *1,5
# 4 *2,4
# 4 *3,3
# 5 *1,4
# 5 *2,3

p num_triples(5)
p num_triples(6)
p num_triples(10)

