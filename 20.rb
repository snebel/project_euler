# Find the sum of the digits in the number 100!

def factorial(n, product = 1)
	n <= 1 ? product : factorial(n - 1, n * product)
end

def sum_digits(num)
	num.to_s.chars.map(&:to_i).inject(:+)
end

puts sum_digits(factorial(100))
