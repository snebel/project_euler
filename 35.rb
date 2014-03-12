# The number, 197, is called a circular prime because all rotations 
# of the digits: 197, 971, and 719, are themselves prime.
#
# How many circular primes are there below one million?
#
# My Notes:
# - Only need to check numbers that are themselves prime
# - This doesn't use permutations, it uses rotations
# - A rotation is found by shifting the first digit off of a number
#   and appending it to the end of the number

require 'prime' 

def rotate(n)
  digits = n.to_s.chars
  (digits << digits.shift).join.to_i
end

def get_rotations(n, orig, ros = [])
  next_ro = rotate(n)
  next_ro == orig ? [orig] + ros : get_rotations(next_ro, orig, ros << next_ro)
end

def is_circle?(n)
  return false if n.to_s.chars.include?('0') 
  get_rotations(n, n).each {|r| return false if !Prime.prime?(r)}
end

limit = 999_999
puts Prime.each(limit).select {|p| is_circle?(p)}.count
