# By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci 
# sequence whose values do not exceed four million,
# find the sum of the even-valued terms.
#
# My Notes: 
# - Even-valued terms can be indexed by 3n+2 for n >= 0
# - Use tail-recursive fibonacci method

def fib(n, prev = 1, sum = 1)
	n == 1 ? sum : fib(n - 1, sum, sum + prev)
end

def sum_even_fibs(limit, sum = 0, n = 0)
  next_fib = fib(3*n + 2)
	next_fib > limit ? sum : sum_even_fibs(limit, sum+next_fib, n+1)
end

puts sum_even_fibs(4000000)