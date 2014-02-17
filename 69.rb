# Euler's Totient function, φ(n) [sometimes called the phi function], is used to
# determine the number of numbers less than n which are relatively prime to n
#
# Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.
#
# My Notes:
# - We can use Euler's product formula to calculate phi(n)

require 'prime'

def phi(n)
  prime_factors = Prime.prime_division(n).map{ |f| f[0] }
  prods = prime_factors.map{ |p| 1 - 1.0/p }
  n * prods.reduce(:*)
end

max, ans = 0, 0

(2..1_000_000).each do |n|
  result = n / phi(n)
  if result > max 
    max = result
    ans = n
  end
end

p max, ans
