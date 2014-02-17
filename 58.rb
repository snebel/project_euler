# Starting with 1 and spiralling anticlockwise in the following way, a square
# spiral with side length 7 is formed.
#
# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49
#
# It is interesting to note that the odd squares lie along the bottom right diagonal,
# but what is more interesting is that 8 out of the 13 numbers lying along both
# diagonals are prime; that is, a ratio of 8/13 ≈ 62%.
#
# If one complete new layer is wrapped around the spiral above, a square spiral
# with side length 9 will be formed. If this process is continued, what is the
# side length of the square spiral for which the ratio of primes along both 
# diagonals first falls below 10%?
#
# My Notes:
# - From #28: corners of an n x n square spiral are 
#   n^2, n^2 - (n-1), n^2 - 2(n-1), n^2 - 3(n-1)
# - An n x n square spiral has 2*n - 1 numbers along its diagonals
# - We can start with a small square and keep track of the number of primes along the
#   diagonals by adding corners for subseqent values of n and selecting prime corners

require 'prime'

def check_prime_ratio(ratio)
  num_primes = 0
  (3..Float::INFINITY).step(2) do |n|
    corners = n**2, n**2 - (n-1), n**2 - 2*(n-1), n**2 - 3*(n-1)
    num_primes += corners.select{ |n| Prime.prime?(n) }.size
    return n if num_primes.to_f / (2*n - 1) < ratio
    n += 2
  end
end

p check_prime_ratio(0.1)
