# Find the sum of the digits in the number 100!

def factorial(n, product = 1)
	n == 1 ? product : factorial(n - 1, n * product)
end

def sum_digits(num_str)
	sum = 0
	num_str.split(//).each { |c| sum += c.to_i }
	sum
end

puts sum_digits(factorial(100).to_s)
