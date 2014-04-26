# Using triangles.txt, a file containing the co-ordinates of one thousand "random" triangles,
# find the number of triangles for which the interior contains the origin.
#
# My Notes:
# - Given two vertices of a triangle, we can form the equation of a line.
# - We can then determine if the third vertice and and a given point are both on the same
#   side (under or above) the given line using inequalities.
# - The given point is in the interior of the triangle if and only if this is the case
#   for all three possible pairs of vertices.

def p3_same_side_as_origin?(p1, p2, p3)
  m = (p2[1] - p1[1]) / (p2[0] - p1[0]).to_f # slope
  b = p1[1] - (m * p1[0]) # y-intercept
  (p3[1] > m * p3[0] + b && 0 > b) ||
  (p3[1] < m * p3[0] + b && 0 < b)
end

def tri_has_o?(tri)
  p1, p2, p3 = tri[0], tri[1], tri[2]
  p3_same_side_as_origin?(p1, p2, p3) &&
  p3_same_side_as_origin?(p1, p3, p2) && 
  p3_same_side_as_origin?(p2, p3, p1)
end

tris = File.readlines('./files/triangles.txt').map do |line|
  t = line.split(',').map(&:to_i)
  [[t[0], t[1]], [t[2], t[3]], [t[4], t[5]]]
end

p tris.count(&method(:tri_has_o?))