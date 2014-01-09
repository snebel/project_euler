# What is the sum of the digits of the number 2^1000?

def sum_array(ints)
  nums = ints.map {|n| n.to_i }
  nums.reduce(:+)
end

puts sum_array((2**1000).to_s.split(//))