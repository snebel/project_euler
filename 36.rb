# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic
# in base 10 and base 2. (Please note that the palindromic number, in either
# base, may not include leading zeros.)
#
# My Note:
# - This problem is easy (and a little cheap) using rubys to_s(base=n) method
# - My own binary conversion method to follow...

def palin?(n)
  str = n.to_s
  str == str.reverse
end

puts (1..999_999).select {|n| palin?(n) && palin?(n.to_s(2))}.reduce(:+)