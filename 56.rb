# Considering natural numbers of the form, a^b, where a, b < 100,
# what is the maximum digital sum?
# 
# My Notes:
# - Ruby can handle very large integers. We can make a list of all a^b,
#   and calculate the digit sum of each one.

class Integer
  def sum_digits
    self.to_s.chars.map(&:to_i).reduce(:+)
  end
end

nums = []
(1..99).each do |a|
  (1..99).each do |b|
    nums << a**b
  end
end

puts nums.map(&:sum_digits).max