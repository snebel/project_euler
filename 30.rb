# Find the sum of all the numbers that can be written 
# as the sum of fifth powers of their digits.
# 
# My Note: there can never be a number with more than 6 digits
# satisfying the property since 9,999,999 => 7(9^5) = 413,343 < 1,000,000.
# So only need to check numbers below 1,000,000.

class Fixnum
  def digits_to_nth(n)
    digits = self.to_s.chars.map(&:to_i)
    digits.map {|d| d**n}.reduce(:+)
  end
end

def nums_with_digit_powers(n)
  (2..1_000_000).inject(0) do |s, x|
    x == x.digits_to_nth(n) ? s += x : s += 0
  end
end

puts nums_with_digit_powers(5)
