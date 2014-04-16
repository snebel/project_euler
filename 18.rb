# Find the maximum total from top to bottom of the triangle below:
#
# My Notes: 
# - We can treat this triangle as a binary tree
# - The maximum path down a binary tree = root + the greater of the maximum path down the
#   left and right subtrees.
# - There is a much more efficient algorithm to use for this problem that I've coded in
#   Problem 67, but there's something elegant to me about recursion so I've left it here

tree = [
  [75],
  [95, 64],
  [17, 47, 82],
  [18, 35, 87, 10],
  [20, 4, 82, 47, 65],
  [19, 1, 23, 75, 3, 34],
  [88, 2, 77, 73, 7, 63, 67],
  [99, 65, 4, 28, 6, 16, 7, 92],
  [41, 41, 26, 56, 83, 4, 8, 7, 33],
  [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
  [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
  [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
  [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
]

def max_path(tree, sum = 0)
  return sum if tree.size == 0
  top = tree.shift[0]
  sub2 = tree.map(&:clone).each(&:shift)
  sub1 = tree.each(&:pop)
  [max_path(sub1, sum + top), max_path(sub2, sum + top)].max
end

puts max_path(tree)
