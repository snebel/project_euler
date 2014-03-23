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
# - We can use the same code as Problem 31 (summing coins to £2), only now our
#   "coin" values are the numbers 1 to 99 and our total is 100
# - I had to go back to problem 31 and rewrite the code to use memoization for
#   this much larger input to avoid millions of recalculations. Runs in ~13ms

VALS = Array(1..99).reverse
total = 100
PREVS = Array.new(total){Array.new(VALS.size)}

def ways(t, idx = 0)
  c = VALS[idx]
  return 1 if c == 1 || t == 0
  return PREVS[t-1][c-1] if PREVS[t-1][c-1]
  res = (0..t/c).inject(0){|sum, i| sum += ways(t - i*c, idx+1)}
  PREVS[t-1][c-1] = res
end

p ways(total)