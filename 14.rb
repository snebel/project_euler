# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Which starting number, under one million, produces the longest chain?

def collatz_length(n, count)
  return count if n == 1
  n % 2 == 0 ? collatz_length(n/2, count+1) : collatz_length(3*n + 1, count+1)
end

def longest_collatz_num(limit)
	lengs = {}
	2.upto(limit) { |n| lengs[collatz_length(n, 0)] = n }
	return lengs[lengs.keys.max]
end

puts longest_collatz_num(1000000)