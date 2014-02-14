# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, 
# contain the same digits.
#
# My Notes:
# -

def compare_digits(x, y)
  x.to_s.chars.sort == y.to_s.chars.sort
end

100.upto(Float::INFINITY).each do |x|
  if (
    compare_digits(x, 2*x) && 
    compare_digits(x, 3*x) &&
    compare_digits(x, 4*x) &&
    compare_digits(x, 5*x) &&
    compare_digits(x, 6*x)
  )
  p x; break
  end
end