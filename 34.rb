# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the
# factorial of their digits.
# note: as 1! = 1 and 2! = 2 are not sums they are not included.
#
# My Notes:
# - a number is curious if sum_factorial_digits(n) == n
# - Single factorial digits range from 1 to 362,880
# - Suppose x is an n-digit number. The max value of 
#   sum_factorial(digits) is n*9!, the min value is n:
#   3-digits (100 to 999) range from 3 to 1,088,640 
#   4-digits (1,000 to 9,999) range from 4 to 1,451,520
#   5-digits (10,000 to 99,999) range from 5 to 1,814,400
#   6-digits (100,000 to 999,000)range from 6 to 2,177,280
#   7-digits (1,000,000 to 9,999,999) range from 7 to 2,540,160
#   8-digits (10,000,000 to 99,999,999) range from 8 to 2,903,040 
# - No n-digit curious numbers for n >= 8 since ranges don't overlap
# - Turns out there are no n-digit curious numbers for n >= 6

def factorial(n, ans = 1)
  n <= 1 ? ans : factorial(n - 1, n * ans)
end

def sum_fact_digits(n)
  n.to_s.chars.map{|c| factorial(c.to_i)}.reduce(:+)
end

p (10..100_000).select {|n| sum_fact_digits(n) == n}.reduce(:+)
