# How many such routes are there through a 20×20 grid?
# My note: Number of paths thru n * n lattice = 2n Choose n.

def factorial(n, product = 1)
	n == 1 ? product : factorial(n - 1, n * product)
end

def calc_grid_paths(k)
	n = 2 * k
	factorial(n) / (factorial(k) * factorial(n - k))
end

puts calc_grid_paths(20)
