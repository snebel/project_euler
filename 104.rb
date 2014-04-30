# Given that Fk is the first Fibonacci number for which the first nine digits AND
# the last nine digits are 1-9 pandigital, find k.
#
# My Notes:
# - The difficult part of this problem is figuring out how to grab the first 9 digits
#   of a Fibonacci number.
# - One way is to divide the number by 10^(number of digits - 9), but this gets very
#   slow for very large numbers, which the Fibonaccis quickly become.
# - A better way is to use the Golden Ratio to generate Fn from n, and use logs and
#   equational reasoning to find the first 9 digits of Fn.
# - We can keep track of the last 9 digits of Fn by calculating Fn % 10^9.
# - However, a significant optimization is to avoid adding huge numbers together. Since
#   we are only interested in the last 9 digits of Fn, we can just add the last 9 digits
#   of Fn-2 and Fn-1 to find the last 9 digits of Fn--so we only need to keep track of the
#   tails of each Fibonacci number and which term, n, we are currently on.
# - Runs in about 5 seconds.

require 'set'

def first_9_Fn_digits(n)
  phi = 0.20898764024997873 # Math.log((1+Math.sqrt(5))/2, 10)
  t = (n * phi) - 0.3494850021680094 # Math.log(Math.sqrt(5), 10)
  (10**(t - t.to_i + 8)).floor
end

f0_tail = f1_tail = 1
n = 2
cut = 10**9
chars = Array('1'..'9').to_set

until f1_tail.to_s.chars.to_set == chars && 
      first_9_Fn_digits(n).to_s.chars.to_set == chars
  f0_tail, f1_tail = f1_tail, (f1_tail + f0_tail) % cut
  n += 1
end

p n