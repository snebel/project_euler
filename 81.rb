# n the 5 by 5 matrix below, the minimal path sum from the top left to the bottom
# right, by only moving to the right and down, is indicated in bold red and is
# equal to 2427.
#
# 131 673 234 103 18
# 201 96  342 965 150
# 630 803 746 422 111
# 537 699 497 121 956
# 805 732 524 37  331
#
# Find the minimal path sum, in matrix.txt, a 31K text file containing a 80 by 80
# matrix, from the top left to the bottom right by only moving right and down.
#
# My Notes:
# - We can use a similar algorithm to problem 67, treating the matrix as a tree whos root
#   is the top-left element and whose rows are the diagonals.
#   Begin with the top-left element, look at the two elements reachable from this point,
#   select the lesser of the two, set its value to itself + the previous element. Repeat
#   this process until the lower-right corner is reached. 
# - For an n x n matrix, there are 2*n - 1 diagonals.
# - To grab the jth diagonal upto the nth diagonal, we can start with the first
#   element of the jth row, and work our way up until row 0.
# - To grab the remaining diagonals, we can start at any element of the last row
#   and work our way up until we reach an element of the last column.

def change_node(matrix, j, k) # row, column index
  if j == 0
    matrix[j][k] += matrix[j][k-1]
  elsif k == 0
    matrix[j][k] += matrix[j-1][k]
  else
    matrix[j][k] += [matrix[j-1][k], matrix[j][k-1]].min
  end
end

def change_top_diag(matrix, i)
  (i-1).downto(0) do |j|
    change_node(matrix, j, i - j - 1)
  end
end

def change_bottom_diag(matrix, i)
  last_row = matrix.size - 1
  (last_row).downto(i - last_row - 1) do |j|
    change_node(matrix, j, i - j - 1)
  end 
end

def find_shortest_path(matrix)
  n = matrix.size
  (2..n).each {|d| change_top_diag(matrix, d)}
  (n+1..2*n-1).each {|d| change_bottom_diag(matrix, d)}
  matrix[n-1][-1]
end

matrix = File.readlines('./files/matrix.txt').map do |line| 
  line.split(',').map(&:to_i)
end

p find_shortest_path(matrix)
