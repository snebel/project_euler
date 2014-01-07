# A palindromic number reads the same both ways.
# The largest palindrome made from the product
# of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the 
# product of two 3-digit numbers.

def is_palindrome?(n)
	s = n.to_s
	s == s.reverse
end

def max_palindrome_product(limit)
	products = []
	1.upto(limit) do |j|
		1.upto(limit) do |k|
			products << j*k
		end
	end
	max_palindrome(products)
end

def max_palindrome(nums)
	pals = []
	nums.each { |num| pals << num if is_palindrome?(num) }
	pals.max
end

puts max_palindrome_product(999)

