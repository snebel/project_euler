# Find the smallest denominator d, having a resilience R(d) < 15499/94744 .
#
# My Notes:
# - We can use Euler's phi function to calculate the number of resilient fractions
#   for each denominator.

require 'prime'

def phi(n)
  prime_factors = Prime.prime_division(n).map(&:first)
  n * prime_factors.inject(1){|prod, p| prod *= (1 - 1.0/p)}
end

2.upto(Float::INFINITY) do |d|
  p d if d % 1000 == 0
  if phi(d) / (d - 1) < 15499.0 / 94744
    p d
    break
  end
end