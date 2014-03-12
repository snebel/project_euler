# By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order
# of size, find the numerator of the fraction immediately to the left of 3/7.
#
# My Notes:
# - We can use Ruby's Rational class to handle reducing fractions 
# - For each divisor, d, we can find the rational closest to but less than 3/7 by
#   setting the numerator to d*3 / 7 with integer division.
# - We can list these rationals for all possible divisors and grab the largest one

# for each divisor, find the fraction closest to 3/7

def closest_fraction_to(num, denom, max_divisor)
  fracs = (2..max_divisor).map {|d| Rational(d*num/denom, d)}
  (fracs - [Rational(num, denom)]).max
end

p closest_fraction_to(3, 7, 1_000_000)
