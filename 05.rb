# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

# Euclid's algorithm
def gcd(a, b)
	b == 0 ? a : gcd(b, a % b)
end

def lcm(a, b)
	(a * b) / gcd(a, b)
end

def find_lcm_upto(max_factor)
	product = 2
	2.upto(max_factor) do |f|
		product = lcm(f, product)
	end
	product
end

puts find_lcm_upto(20)
