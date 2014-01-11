# How many such routes are there through a 20×20 grid?
# My note: Number of paths thru n * n grid = 2n Choose n.

def factorial(n, product = 1)
	n == 1 ? product : factorial(n - 1, n * product)
end

def binom_coefficient(n, k)
	factorial(n) / (factorial(k) * factorial(n - k))
end

# calculates number of possible paths for an n x n lattice
def calc_grid_paths(n)
	binom_coefficient(2*n, n)
end

puts calc_grid_paths(20)
