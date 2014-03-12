# Starting with the number 1 and moving to the right in a 
# clockwise direction a 5 by 5 spiral is formed as follows:
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# What is the sum of the numbers on the diagonals
# in a 1001 by 1001 spiral formed in the same way?
#
# My Notes:
# - 5 x 5 sprial consists of numbers 1-25, so
#   1001 x 1001 spiral cosists of numbers 1-100201
# - corners of 5 x 5: 13, 17, 21, 25
# - corners of n x n: n^2, n^2 - (n-1), n^2 - 2(n-1), n^2 - 3(n-1)

# sums diagonals of n x n spiral
def sum_diagonals(n)
  return n if n <= 1
  4 * (n**2) - 6 * (n-1) + sum_diagonals(n-2)
end

puts sum_diagonals(1001)