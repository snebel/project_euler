# What is the first term in the Fibonacci
# sequence to contain 1000 digits?

def fib(n, prev = 1, sum = 1)
  n <= 2 ? sum : fib(n - 1, sum, prev + sum)
end

def first_n_digit_fib(n)
  limit = 10**(n-1)
  1.upto(Float::INFINITY) { |i| return i if fib(i) >= limit }
end

puts first_n_digit_fib(1000)
