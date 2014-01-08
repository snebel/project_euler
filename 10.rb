# Find the sum of all the primes below two million.

def is_prime?(n)
  2.upto(Math.sqrt(n).to_i) { |num| return false if n % num == 0 }
  n == 1 ? false : true
end

def sum_primes_upto(limit)
	sum = 0
	2.upto(limit) { |n| sum += n if is_prime? n }
	sum
end

puts sum_primes_upto(2000000)

# NOTE: sieve of Eratosthenes would be more efficient, but require more code.