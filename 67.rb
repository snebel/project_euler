# Find the maximum total from top to bottom in triangle.txt,
# a triangle with one-hundred rows.
#
# My Notes:
# - The algorithm is as follows (ack):
#   (1) Begin with the penultimate row. For each element of this row, change the value
#       to the sum of the element and its greatest child
#   (2) Remove the row and repeat the process until the root is reached

tri = File.readlines("./files/triangle.txt").map do |x|
  x.split(' ').map(&:to_i)
end

def max_path(tri)
  for i in (tri.length-1).downto(1)
    for j in (0...i)
      tri[i-1][j] += [tri[i][j], tri[i][j+1]].max
    end
  end
  tri[0][0]
end

p max_path(tri)


