# 75
# 95 64
# 17 47 82
# 18 35 87 10
# 20 04 82 47 65
# 19 01 23 75 03 34
# 88 02 77 73 07 63 67
# 99 65 04 28 06 16 70 92
# 41 41 26 56 83 40 80 70 33
# 41 48 72 33 47 32 37 16 94 29
# 53 71 44 65 25 43 91 52 97 51 14
# 70 11 33 28 77 73 17 78 39 68 17 57
# 91 71 52 38 17 14 91 43 58 50 27 29 48
# 63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

#    3 
#   7 4
#  2 4 6
# 8 5 9 3
# t = [ [3], [7,4], [2,4,6], [8,5,9,3] ]

# 3 + ...
# max_path(
#   7
#  2 4
# 8 5 9
# ) or
# max_path(
#   4
#  4 6
# 5 9 3
# )

def split_tree(tree)
	top = tree.shift.first
  sub1 = o1.map { |row| row.pop; row }
  print sub1
  print o1
  print tree
  sub2 = o2.map { |row| row.shift; row }
  #print sub2
  return sub1, sub2
end

def max_path(tree, sum = 0)
	return sum if tree.size == 0
	sub1, sub2 = first_sub(tree), second_sub(tree)
	[max_path(sub1, sum + sub1.top), max_path(sub2, sum + sub2.top)].max
end

# split_tree([ [3], [7,4], [2,4,6], [8,5,9,3] ])



