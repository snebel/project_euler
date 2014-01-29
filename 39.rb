# If p is the perimeter of a right angle triangle with integral length
# sides, {a,b,c}, there are exactly three solutions for p = 120.
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p ≤ 1000, is the number of solutions maximised?
#
# My Notes:
# - For p ≤ 1000, need all triples a, b, c such that a + b + c = p,
#   and a^2 + b^2 = c^2.
# - For a given p, max side length of a, b is p/3.

def find_num_triangle_solutions(limit)
counts = Hash.new(0)

1.upto(limit) do |p|
  1.upto(p/3) do |a|
    a.upto((p-a)/2) do |b|
      c = p - a - b
      counts[p] += 1 if (a + b + c) == p && (a**2 + b**2) == c**2
    end
  end
end
return counts
end

counts = find_num_triangle_solutions(1000)
puts max_val = counts.values.max
puts counts.key(max_val)