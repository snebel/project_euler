# What is the first term in the Fibonacci sequence to contain 1000 digits?

def first_fib_above(lim)
  fibs = [1, 1]
  fibs << fibs[-1] + fibs[-2] while fibs[-1] < lim 
  fibs.size
end

p first_fib_above(10**999)