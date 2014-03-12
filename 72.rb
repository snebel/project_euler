# How many elements would be contained in the set of reduced proper
# fractions for d ≤ 1,000,000?
#
# My Notes:
# - For a divisor, d, and numerator, n < d, n/d will only be a reduced proper
#   fraction if gcd(n, d) is 1.
# - We therefore need the total number of relatively prime pairs (n, d) for
#   every d ≤ 1,000,000.
# - We can use Euler's Totient function, phi(d), from problem 69 to get
#   the number of numbers less than d that are relatively prime to d.

require 'prime'

def phi(n)
  prime_factors = Prime.prime_division(n).map{|f| f[0]}
  n * prime_factors.inject(1){|prod, p| prod *= (1 - 1.0/p)}
end

p (2..1_000_000).inject(0){|sum, n| sum += phi(n)}