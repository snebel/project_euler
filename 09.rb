# There exists exactly one Pythagorean
# triplet for which a + b + c = 1000.
# Find the product abc.

#list all triplets adding to sum
def get_triples(sum)
	triples = []
	1.upto(sum/3) do |num|
		pairs = get_pairs_summing_to(1000-num)
		pairs.each { |pair| triples << (pair + [num]).sort! }
	end
	triples
end

def get_pairs_summing_to(sum)
	1.upto(sum/2).map do |num|
		[num, sum-num]
	end
end

def is_pythag?(triples)
	triples.each do |t| 
		return t[0]*t[1]*t[2] if (t[0]**2 + t[1]**2 == t[2]**2)
	end
end

triples = get_triples(1000)
puts is_pythag?(triples)