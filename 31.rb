# In England the currency is made up of pound, £, and pence, p, 
# and there are eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# How many different ways can £2 be made using any number of coins?
#
# My Notes:
# - Need all linear combinations of a..h such that
#   a*1 + b*2 + c*5 + d*10 + e*20 + f*50 + g*100 + h*200 = 200
# - The number of ways to sum the coins to 200p equals the number of ways to sum to
#   200p using a £2 coin + the number of ways using only smaller coins
# - We can assert that the number of ways to sum coins to an amount, t, given a largest
#   coin-value, c, equals the sum of the number of ways to sum to t using a fixed number
#   of c-valued coins for each of 0 through t/c
# - Our base case is the case where c = 1, for which there is only 1 way to sum to any total 
# - We'll store found values in a 2d array to avoid repeated calculations

VALS = [200, 100, 50, 20, 10, 5, 2, 1]
total = 200
PREVS = Array.new(total){Array.new(VALS.size)}

def ways(t, idx = 0)
  c = VALS[idx]
  return 1 if c == 1 || t == 0
  return PREVS[t-1][c-1] if PREVS[t-1][c-1]
  res = (0..t/c).inject(0){|sum, i| sum += ways(t - i*c, idx+1)}
  PREVS[t-1][c-1] = res
end

p ways(total)