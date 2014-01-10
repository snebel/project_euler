# How many such routes are there through a 20×20 grid?
# My note: length of paths in n*n grid are 2*n


def factorial_helper(n, product)
	n == 1 ? product : factorial_helper(n-1, n*product)
end

def factorial(n)
	factorial_helper(n, 1)
end

def binom_coefficient(n, k)
	factorial(n) / (factorial(k) * factorial(n - k))
end

# calculates number of possible paths for an n x n lattice
def calc_grid_paths(n)
	binom_coefficient(2*n, n)
end

puts calc_grid_paths(20)
