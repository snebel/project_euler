# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

# Euclid's algorithm
def gcd(a, b)
	b == 0 ? a : gcd(b, a % b)
end

def lcm(a, b)
	(a * b) / gcd(a, b)
end

def find_lcm_upto(max)
  product = 2
  3.upto(max) {|n| product = lcm(n, product)}
  product
end

puts find_lcm_upto(20)
