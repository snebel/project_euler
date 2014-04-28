# The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
# containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product
# identity can be written as a 1 through 9 pandigital.
#
# My Notes:
# - Need total of 9 digits:
#   2-digit * 3-digit = 4-digit
#   1-digit * 4-digit = 4-digit
# - This is a brute force method.

def is_pandigital?(m1, m2, prod)
  str = m1.to_s + m2.to_s + prod.to_s
  str.chars.sort == Array('1'..'9')
end

NUMS = []

def find_pandig_products(low1, high1, low2)
  low1.upto(high1) do |multiplicand|
    low2.upto(10000/multiplicand) do |multiplier|
      prod = multiplicand * multiplier
      NUMS << prod if is_pandigital?(multiplicand, multiplier, prod)
    end
  end
end

find_pandig_products(10, 99, 100)
find_pandig_products(1, 9, 1000)

puts NUMS.uniq.reduce(:+)
