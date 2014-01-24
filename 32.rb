# The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
# containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product
# identity can be written as a 1 through 9 pandigital.
#
# My Notes:
# - Need total of 9 digits: 2-digit * 3-digit = 4-digit
# - This is a brute force method.

def is_pandigital?(m1, m2, prod)
  str = m1.to_s + m2.to_s + prod.to_s
  arr = str.split(//)
  arr.uniq!
  arr.size == 9 && !arr.include?("0")
end

nums = []
10.upto(99) do |multiplicand|
  100.upto(999) do |multiplier|
    prod = multiplicand * multiplier
    if prod < 10000 && is_pandigital?(multiplicand, multiplier, prod)
      nums << prod
    end
  end
end

1.upto(9) do |multiplicand|
  1000.upto(9999) do |multiplier|
    prod = multiplicand * multiplier
    if prod < 10000 && is_pandigital?(multiplicand, multiplier, prod)
      nums << prod
    end
  end
end

puts nums.uniq.reduce(:+)
