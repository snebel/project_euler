# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# My Notes:
# - We can use Euclid's formula to generate Pythagorean triples.
# - The formula states that for any positive integers m and n with m > n,
#   a = m^2 - n^2, b = 2mn, c = m^2 + n^2 forms a Pythagorean triple.

def first_triple(sum)
	for m in (2..1.0/0) # 1.0/0 => Infinity
		for n in (1..m-1)
			a, b, c = [m**2 - n**2, 2*m*n, m**2 + n**2]
			return [a, b, c] if a + b + c == sum
		end
	end
end

p first_triple(1_000).reduce(:*)



