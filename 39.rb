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
# - There will be no solution for odd values of p:
#
#   The only ways p could be odd is if (1) each of a, b, c is odd, or
#   (2) two of a, b, c are odd and the other is even.
#
#   If (1), then we must have that odd^2 + odd^2 = odd^2 =>
#   odd + odd = odd => even = odd, which is impossible.
#
#   If (2), then we must have either (i) even^2 + even^2 = odd^2 =>
#   even + even = odd => even = odd, which is impossible, or (ii)
#   even^2 + odd^2 = even^2 => even + odd = even => odd = even,
#   which is also impossible. Therefore we only need to check
#   even values of p.

def find_triangle_solutions_counts(limit)
  counts = Hash.new(0) # key p, value num solutions

  (2..limit).step(2) do |p|
    1.upto(p / 3) do |a|
      a.upto((p - a) / 2) do |b|
        c = p - a - b
        counts[p] += 1 if a + b + c == p && a**2 + b**2 == c**2
      end
    end
  end
  counts
end

counts = find_triangle_solutions_counts(1000)
puts max_val = counts.values.max
puts counts.key(max_val)
