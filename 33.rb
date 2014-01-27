# The fraction 49/98 is a curious fraction, as an inexperienced
# mathematician in attempting to simplify it may incorrectly
# believe that 49/98 = 4/8, which is correct, is obtained by 
# cancelling the 9s.
#
# There are exactly four non-trivial examples of this type of 
# fraction, less than one in value, and containing two digits 
# in the numerator and denominator.
# 
# If the product of these four fractions is given in its lowest
# common terms, find the value of the denominator.
#
# My Notes:
# - a fraction is 'curious' if when the ones-digit of the numerator
#   equals the tens-digit of the denominator, removing this shared
#   digit is an accurate way of simplifying the fraction.

product = Rational(1)

10.upto(98) do |num|
  (num+1).upto(99) do |denom|
    if num % 10 == denom / 10 and denom % 10 != 0
      orig = Rational(num, denom)
      product *= orig if orig == Rational(num/10, denom%10)
    end
  end
end

puts product.denominator
