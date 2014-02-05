# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
#
# My Notes:
# - Quick one-liner in ruby

limit = 1000
puts 1.upto(limit).map{ |n| n**n }.reduce(:+).to_s[-10,10]