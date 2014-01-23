# How many distinct terms are in the sequence generated
# by a^b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?
# My Note: Ruby's uniq method makes this easy and efficient

def distinct_powers(a_limit, b_limit)
  nums = []
  2.upto(a_limit) do |a|
    2.upto(b_limit) { |b| nums << a**b }
  end
  nums.uniq.count
end

puts distinct_powers(100, 100)