# Take the number 192 and multiply it by each of 1, 2, and 3:
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576.
# We will call 192384576 the concatenated product of 192 and (1,2,3).
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, 
# and 5, giving the pandigital, 918273645, which is the concatenated product
# of 9 and (1,2,3,4,5).
#
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as 
# the concatenated product of an integer with (1,2, ... , n) where n > 1?
#
# My Notes: Let x be the integer to be multiplied.
# - Must end up with n products totaling exactly 9 digits.
# - For int i, num digits of  (i + 1) * x equals or is 1 greater than num digits of i * x
# - All general possibilities for number of digits:
#   n = 2: 1 * x = 4-d, 2 * x = 5-d
#   n = 3: 1 * x = 3-d, 2 * x = 3-d, 3 * x = 3-d
#   n = 4: 1 * x = 2-d, 2 * x = 2-d, 3 * x = 2-d, 4 * x = 3-d
#   n = 5: 1 * x = 1-d, 2 * x = 2-d, 3 * x = 2-d, 4 * x = 2-d, 5 * x = 2-d 
#   n = 6: 1 * x = 1-d, 2 * x = 1-d, 3 * x = 1-d, 4 * x = 2-d, 5 * x = 2-d, 6 * x = 2-d
#   n = 7: not possible
#   n = 8: not possible
#   n = 9: Only when x = 1. Yields lowest pandigital 123456789, so we can ignore this case

def concatenate_prods(x, n)
  1.upto(n).map { |i| (i*x) }.join
end

def pandigital?(n)
  n.size == 9 && (n.chars.uniq - ['0']).size == 9
end

PANS = []

def get_pans(n)
  start = 10 ** (9 / n)
  limit = start*10 

  start.upto(limit) do |x|
    1.upto(n) do |i|
      p = concatenate_prods(x, i)
      PANS << p.to_i if pandigital?(p)
    end
  end
end

2.upto(6) {|n| get_pans(n)}

puts PANS.max

