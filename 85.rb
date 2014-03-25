# By counting carefully it can be seen that a rectangular grid measuring 3 by 2
# contains eighteen rectangles.
#
# Although there exists no rectangular grid that contains exactly two million
# rectangles, find the area of the grid with the nearest solution.
#
# My Notes:
# - Given an m x n rectangle, we can classify the dimmensions of all types of
#   subrectangles as j x k for all 1 ≤ j ≤ n and all 1 ≤ k ≤ m, yielding m * n possibilities
# - Given a j x k sub-rectangle, we can calculate the number of subrectangles that would 
#   fit inside the original m x n rectangle based on dimmensions:
# - There are m - j + 1 horizontal positions, and n - k + 1 vertical positions for each
#   horizontal position, yielding a total of (m - j + 1)(n - k + 1) different subrectangles
#   of a given type.
# - For dimmensions m x n no need to also check n x m since these will have the same answer
# - We'll take an educated guess that m and n are both 2-digit numbers

def num_sub_rectangles(m, n)
  count = 0
  for j in (1..m)
    for k in (1..n)
      count += (m - j + 1)*(n - k + 1)
    end
  end
  count
end

hash = {} # [m, n] => distance from 2,000,000
for m in (10..100)
  for n in (m..100)
    hash[[m,n]] = (num_sub_rectangles(m, n) - 2_000_000).abs
  end
end

p hash.key(hash.values.min).reduce(:*)