# Find the sum of all the numbers that can be written 
# as the sum of fifth powers of their digits.
# 
# My Note: there can never be a number with more than 6 digits
# satisfying the property since 9,999,999 => 7(9^5) = 413,343 < 1,000,000.
# So only need to check numbers below 1,000,000.

class Fixnum
  def digits_to_nth(n)
    self.to_s.chars.map(&:to_i).map{|d| d**n}.reduce(:+)
  end
end

p (2..1_000_000).select {|n| n == n.digits_to_nth(5)}.reduce(:+)