# By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci 
# sequence whose values do not exceed four million,
# find the sum of the even-valued terms.
#
# My note: even-valued terms can be indexed
# by 3n + 2, n a non-negative integer

def fib(n, prev = 1, sum = 1)
	n == 1 ? sum : fib(n - 1, sum, sum + prev)
end

def sum_even_fibs_upto(limit, sum, n)
	return sum if fib(3*n + 2) > limit
	sum_even_fibs_upto(limit, sum + fib(3*n + 2), n+1)
end

puts sum_even_fibs_upto(4000000, 0, 0)