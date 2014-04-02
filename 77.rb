# It is possible to write ten as the sum of primes in exactly five different ways:
# 7 + 3
# 5 + 5
# 5 + 3 + 2
# 3 + 3 + 2 + 2
# 2 + 2 + 2 + 2 + 2
#
# What is the first value which can be written as the sum of primes in over five
# thousand different ways?
#
# My Notes:
# - We can use most of the same code as problems 76 and 31. For each
#   total amount, the VALS/values/"coins" will be the prime numbers below the total.
# - We'll avoid the memoization included in problem 76 to simplify the code
# - The main difference in this problem is that 1 will not be included in our list of
#   values. When c gets down to its lowest value, 2, we must return 1 if the total is 
#   even and 0 otherwise since there is no way to write an odd number as a sum of 2s.

require 'prime'

def ways(t, idx = 0, vals = Prime.take_while{|p| p <= t}.reverse)
  c = vals[idx]
  return t.even? ? 1 : 0 if c == 2
  (0..t/c).map{|i| ways(t - i*c, idx+1, vals)}.inject(:+)
end

total = 2
total += 1 while ways(total) < 5_000
p total