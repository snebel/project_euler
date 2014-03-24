# It is possible to show that the square root of two can be expressed as an
# infinite continued fraction.
# √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
#
# By expanding this for the first four iterations, we get:
# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
#
# The next three expansions are 99/70, 239/169, and 577/408, but the eighth 
# expansion, 1393/985, is the first example where the number of digits in the
# numerator exceeds the number of digits in the denominator.
#
# In the first one-thousand expansions, how many fractions contain a numerator
# with more digits than denominator?
#
# My Notes:
# - If we consider each numerator-denominator pair in the sequence to be (x, y),
#   then each subsequent term is found by (x + 2*y, x + y)
# - I think a tail-recursive iteration here is more readable and elegant than a loop

def check_expansions(limit, x = 3, y = 2, count = 0)
  return count if limit == 0
  count += 1 if x.to_s.size > y.to_s.size
  check_expansions(limit-1, x + 2*y, x + y, count)
end

p check_expansions(1_000)