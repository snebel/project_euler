# What is the first term in the Fibonacci sequence to contain 1000 digits?
#
# My Notes:
# - A number will contain at least n digits if it is at least 10^(n-1)
# - We can enumerate a list of Fibonacci numbers until the last number exceeds a limit

def first_fib_term_above(lim)
  fibs = [1, 1]
  fibs << fibs[-1] + fibs[-2] while fibs[-1] < lim 
  fibs.size
end

p first_fib_term_above(10**999)