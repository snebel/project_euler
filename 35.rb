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

def rotation(n)
  digits = n.to_s.chars
  last = digits.shift
  digits << last
  digits.join.to_i
end

def get_rotations(n, origin, ros = [])
  next_ro = rotation(n)
  if next_ro == origin || origin % 10 == 0 || next_ro.to_s.size < origin.to_s.size
    [origin] + ros 
  else
    get_rotations(next_ro, origin, ros << next_ro)
  end
end

def is_circle?(n)
  return false if n.to_s.chars.include?('0') 
  ros = get_rotations(n, n)
  ros.each {|r| return false if !Prime.prime?(r)}
  return true
end

limit = 999_999

puts Prime.each(limit).select {|p| is_circle?(p)}.size
