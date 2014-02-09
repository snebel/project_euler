# The first two consecutive numbers to have two distinct prime factors are:
# 14 = 2 × 7
# 15 = 3 × 5
# The first three consecutive numbers to have three distinct prime factors are:
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
#
# Find the first four consecutive integers to have four distinct prime factors.
# What is the first of these numbers?
#
# My Notes:
# - We can start with 647 and check subsequent numbers for at least 4 prime factors

require 'prime'

def check_nums(start = 647)
  consecs = []
  start.upto(Float::INFINITY) do |n|
    return consecs if consecs.size >= 4
    Prime.prime_division(n).size >= 4 ? consecs << n : consecs = []
  end
end

puts check_nums.first