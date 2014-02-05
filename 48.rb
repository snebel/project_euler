# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.
#
# My Notes:
# - Quick one-liner in ruby

limit = 1000
puts 1.upto(limit).map{ |n| n**n }.reduce(:+).to_s[-10,10]