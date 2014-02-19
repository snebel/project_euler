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
# - Lets start by using a similar algorithm to problem 67:
#   Begin with the top-left element, look at the two elements reachable from this point,
#   select the lesser of the two, set its value to itself + the previous element. Repeat
#   this process until the lower-right corner is reached. 

test = [
  [131,673,234,103,18],
  [201,96,342,965,150],
  [630,803,746,422,111],
  [537,699,497,121,956],
  [805,732,524,37, 331],
]

matrix = File.readlines('./files/matrix.txt').map do |line| 
  line.split(',').map(&:to_i)
end

def check_children(matrix, j=0, k=0) # row, column
  current = matrix[j][k]
  p current
  return current if j == 4 && k == 4
  if j == 4
    matrix[j][k+1] += current
    check_children(matrix, j, k+1)
  elsif k == 4
    matrix[j+1][k] += current
    check_children(matrix, j+1, k)
  else
    matrix[j+1][k] += current 
    matrix[j][k+1] += current
    down, right = matrix[j+1][k], matrix[j][k+1]
    down <= right ? j += 1 : k += 1
    
    check_children(matrix, j, k)
  end
end

p check_children(test)


