# Find the sum of the digits in the number 100!

def factorial(n)
	n == 1 ? n : n * factorial(n-1)
end

def sum_digits(num_str)
	sum = 0
	num_str.split(//).each { |c| sum += c.to_i }
	sum
end

print sum_digits(factorial(100).to_s)
