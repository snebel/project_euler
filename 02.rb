# By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci 
# sequence whose values do not exceed four million,
# find the sum of the even-valued terms.

# We start by noting that even valued terms can be indexed
# by the formula 3n + 2, where n is a non-negative integer
def get_fib(n)
	return 1 if n == 1
	return 2 if n == 2	
	get_fib(n-1) + get_fib(n-2)
end


def sum_even_fibs_upto(limit, sum, n)
	return sum if get_fib(3*n + 2) > limit
	sum_even_fibs_upto(limit, sum + get_fib(3*n + 2), n+1)
end

puts sum_even_fibs_upto(4000000, 0, 0)