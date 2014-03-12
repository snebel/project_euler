# By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order
# of size, find the numerator of the fraction immediately to the left of 3/7.
#
# My Notes:
# - Ruby's Rational class will be helpful
# - Only need to list proper fractions upto 3/7 with denominator ≤ 1,000,000
# - Or can try to find the closest possible fraction below 3/7 with a d ≤ 1,000,000
# - get all pairs of numbers that are relatively prime and form a rational below 3/7?

def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end

limit = Rational(3, 7)

def average(frac, limit)
  (frac + limit) / 2 
end

2.upto(1_000_000).each do |