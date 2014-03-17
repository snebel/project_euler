# Using triangles.txt, a text file containing the co-ordinates of one thousand
# "random" triangles, find the number of triangles for which the interior 
# contains the origin.
#
# My Notes:
# - Given points A,B,C we can make an equation of the line of each side of the triangle
# - We can turn each line equation into an inequality, with direction determined by 
#   the signs of the y-coordinates of the two endpoints
# - A triangle contains the origin if the (x, y) point (0, 0) is true for all 3 inequalities

triangles = File.readlines('./files/triangles.txt').map do |line|
  cs = line.split(',').map(&:to_i)
  tri = [[cs[0], cs[1]], [cs[2], cs[3]], [cs[4], cs[5]]]
  tri.sort_by{|pair| pair[1]}
end

# forms an inequality of a line based on two points
# checks if the point (x, y) fits the inequality
def check_line_equation(x1, y1, x2, y2, x, y, op)
  m = (y2 - y1).to_f / (x2 - x1)
  b = y1 - m*x1
  right_side = m*x + b
  if op == 'greater'
    return y > right_side, b > 0 # true if positive slope
  elsif op == 'less'
    return y < right_side, b > 0
  end
end

def check_three_sides(tri, x, y)
  low_mid = check_line_equation(tri[0][0], tri[0][1], tri[1][0], tri[1][1], x, y, 'greater')
  low_high = check_line_equation(tri[0][0], tri[0][1], tri[2][0], tri[2][1], x, y, 'less')
  if low_mid[1] == low_high[1]
    mid_high = check_line_equation(tri[1][0], tri[1][1], tri[2][0], tri[2][1], x, y, 'greater')
  else
    mid_high = check_line_equation(tri[1][0], tri[1][1], tri[2][0], tri[2][1], x, y, 'less')
  end
  low_mid[0] && low_high[0] && mid_high[0]
end

# # test data: A(-340,495), B(-153,-910), C(835,-947); X(-175,41), Y(-421,-714), Z(574,-645)
# test = [
#   {A: [-340, 495], B: [-153, -910], C: [835, -947]},
#   {A: [-175, 41], B: [-421, -714], C: [574, -645]}
# ]

# tri = test.first
# p check_line_equation(tri[0][0], tri[:A][1], tri[:C][0], tri[:C][1], 0, 0)

# p check_line_equation(-340, 495, 835, -947, 0, 0)
# p check_line_equation(-175, , 835, -947, 0, 0)

count = 0

triangles.each do |triangle|
  count += 1 if check_three_sides(triangle, 0, 0)  
end

p count
# p triangles[0]
# p triangles[1]
# p check_three_sides(triangles[0], 0, 0)
# p check_three_sides(triangles[1], 0, 0)




