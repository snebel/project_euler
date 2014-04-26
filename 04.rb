# A palindromic number reads the same both ways. The largest palindrome made from the product
# of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

def max_palindrome_product(limit)
	products = []
	1.upto(limit) do |j|
		1.upto(limit) do |k|
			prod = j * k
			products << prod if prod.to_s == prod.to_s.reverse
		end
	end
	products.max
end

p max_palindrome_product(999)

