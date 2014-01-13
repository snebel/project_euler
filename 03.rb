# What is the largest prime factor of 600851475143 ?
#

def is_prime?(n)
  2.upto(Math.sqrt(n).to_i) { |num| return false if n % num == 0 }
  n == 1 ? false : true
end

def prime_factors(n, primes = [])
	return primes << n if is_prime?(n)
	2.upto(n) do |f|
		if n % f == 0 && is_prime?(f)
			return prime_factors(n / f, primes << f)
		end
	end
end

puts prime_factors(600851475143).max
