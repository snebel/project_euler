# The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power
# is 28. In fact, there are exactly four numbers below fifty that can be expressed in such a way:
# 28 = 22 + 23 + 24
# 33 = 32 + 23 + 24
# 49 = 52 + 23 + 24
# 47 = 22 + 33 + 24
#
# How many numbers below fifty million can be expressed as the sum of a prime square, prime cube,
# and prime fourth power?
#
# My Notes:
# - We don't want to think about this problem in terms of starting with a number below 50,000,000
#   and trying to determine if it can be written as a prime power triple.
# - Instead, we want to determine how many unique prime power triples we can form below 50,000,000.
# - There are only 908, 73, and 23 possible square roots, cube roots, and fourth roots respectively
#   from which a prime power triple can be formed.
# - We can use a Set instead of an Array to hold our values so duplications are avoided automatically
# - Runs in ~1.6 seconds

require 'prime'
require 'set'

square_roots = Prime.take_while{|p| p**2 < 50_000_000}
cube_roots = Prime.take_while{|p| p**3 < 50_000_000}
fourth_roots = Prime.take_while{|p| p**4 < 50_000_000}
nums = Set.new

square_roots.each do |s|
  cube_roots.each do |c|
    fourth_roots.each do |f|
      sum = s**2 + c**3 + f**4
      nums << sum if sum < 50_000_000
    end
  end
end

p nums.size