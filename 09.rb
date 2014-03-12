# There exists exactly one Pythagorean
# triplet for which a + b + c = 1000.
# Find the product abc.

#list all triplets adding to sum
def triples_summing_to(sum)
	triples = []
	1.upto(sum/3) do |num|
		pairs_summing_to(1000 - num).each do |pair|
			triples << (pair << num).sort
		end
	end
	triples
end

def pairs_summing_to(sum)
	1.upto(sum/2).map {|num| [num, sum-num]}
end

def first_pythag(triples)
	triples.each do |t| 
		return t[0]*t[1]*t[2] if t[0]**2 + t[1]**2 == t[2]**2
	end
end

puts first_pythag(triples_summing_to(1000))