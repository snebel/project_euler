# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, 
# contain the same digits.
#
# My Notes:
# -

def digits(x, y)
  x.to_s.chars.sort == y.to_s.chars.sort
end

100.upto(Float::INFINITY).each do |x|
  if (2..6).map{|n| digits(x, n*x)}.reduce(:&)
    p x
    break
  end
end