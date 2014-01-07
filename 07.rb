# By listing the first six prime numbers: 
# 2, 3, 5, 7, 11, and 13, we can see that 
# the 6th prime is 13.
# What is the 10 001st prime number?

def is_prime?(n)
	return false if n == 1
  2.upto(Math.sqrt(n).to_i) { |num| return false if n % num == 0 }
  return true
end


def find_nth_prime(n)    
  primes = []
  num = 1
  while primes.size < n
  	primes << num if is_prime?(num)
  	num += 1
  end

  primes.last
end

puts find_nth_prime(10001)