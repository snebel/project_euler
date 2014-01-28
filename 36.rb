# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic
# in base 10 and base 2. (Please note that the palindromic number, in either
# base, may not include leading zeros.)
#
# My Note:
# - This problem is easy (and a little cheap) using rubys to_s(base=n) method,
#   so I've written my own tail-recursive binary method.
# - A palindrome number in binary must be odd, so only need to check odds

def palin?(n)
  str = n.to_s
  str == str.reverse
end

def binary(x, n = Math.log(x, 2).to_i, bi = [])
  n == -1 ? bi.join : binary(x % (2**n), n-1, bi << (x / 2**n))
end

p (1..999_999).step(2).select {|n| palin?(n) && palin?(binary(n))}.reduce(:+)
