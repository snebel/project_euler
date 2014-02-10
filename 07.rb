# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that 
# the 6th prime is 13.
#
# What is the 10,001st prime number?
#
# My Notes:
# - If we use Ruby's Prime class, we can solve this in one line: Prime.first(10_001).last

def is_prime?(n)
  2.upto(Math.sqrt(n).to_i) { |num| return false if n % num == 0 }
  true
end

def find_nth_prime(n)    
  primes = [2]
  num = 3
  while primes.size < n
  	primes << num if is_prime?(num)
  	num += 2
  end
  primes.last
end

puts find_nth_prime(10001)

# Using Ruby's Prime class
# require 'prime'
# def nth_prime(n)
#   Prime.first(n).last
# end
# puts nth_prime(10_001)
