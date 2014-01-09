# How many such routes are there through a 20×20 grid?

# length of paths in n*n grid are 2*n

# 20 * 20 grid: 40 moves
# 1*1: 2 paths
# 2*2: 6 paths
# 3*3: 2*6 + 1*3 + 1*3 + 1*1 + 1*1 = 20
# 4*4: 2*20 + 


# use recursion: base case: 1*1 has 2 paths
# consider n*n, suppose can calculate for all smaller sqaures

def calc_grid_paths(n)
	return 2 if n == 1
	n*calc_grid_paths(n-1) + 2
end

puts calc_grid_paths(20)

