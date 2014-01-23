# What is the sum of the digits of the number 2^1000?

class Bignum
  def sum_digits
    self.to_s.chars.map(&:to_i).reduce(:+)
  end
end

puts (2**1000).sum_digits