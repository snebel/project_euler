# We shall say that an n-digit number is pandigital if it makes use of all
# the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital
# and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
#
# My Notes:
# - A number is divisible by 3 if the sum of its digits is divisible by 3.
#   There can't be any 8 or 9-digit pandigital primes since 1+...+8 = 36,
#   and 1+...+9 = 45
# - Similarly, there are no possibilities for n = 2, 3, 5, or 6
# - For a given n, there are n! pandigital numbers below 10^n
# - We can use the ruby line Prime.each(limit).to_a.size to determine
#   how many primes there are below a certain limit. The number of 
#   pandigitals below each limit is in parentheses
#   1,000: 168 (3! = 6)
#   10,000: 1,229 (4! = 24)
#   100,000: 9,592 (5! = 120)
#   1,000,000: 78,498 (6! = 720)
#   10,000,000: 664,579 (7! = 5,406)...
# - So rather than checking every number upto a limit for both properties
#   or checking if all primes upto a limit are pandigital, we should start with
#   a sequence of pandigitals and check for primality.
# - Calling .permutation on the array [n, n-1, ... , 1] will give the n-pandigital
#   numbers in decreasing order.

def pandigital?(x, n = x.to_s.size)
  (1..n).to_a == x.to_s.chars.map(&:to_i).sort
end

def is_prime?(n)
  2.upto(Math.sqrt(n).to_i) { |i| return false if n % i == 0 }
  true
end

def max_pandigital_prime(digits)
  perms = digits.permutation.map { |p| p.join.to_i }
  perms.each { |p| return p if is_prime?(p) }
  max_pandigital_prime(digits[1..-1])
end

puts max_pandigital_prime([7,6,5,4,3,2,1])
