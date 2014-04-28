# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# My Notes:
# - We can use Euclid's formula to generate Pythagorean triples.
# - The formula states that for any positive integers m and n with m > n,
#   a = m^2 - n^2, b = 2mn, c = m^2 + n^2 forms a Pythagorean triple.

def first_triple(sum)
	for n in (1..Math.sqrt(sum/3))
		for m in (n+1..Math.sqrt(sum - n**2))
			a, b, c = [m**2 - n**2, 2*m*n, m**2 + n**2]
			return [a, b, c] if a + b + c == sum
		end
	end
end

p first_triple(1_000).reduce(:*)



