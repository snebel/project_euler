# Find the difference between the sum of the squares of the
# first one hundred natural numbers and the square of the sum.
#
# My Notes:
# - Use standard formulas to find sum of first n squares and
#   sum of the first n natural numbers

def find_difference(n)
  sq_sum = (n * (n + 1) / 2)**2
  sum_sqs = (n * (2 * n + 1) * (n + 1)) / 6
  sq_sum - sum_sqs
end

puts find_difference(100)
