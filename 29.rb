# How many distinct terms are in the sequence generated
# by a^b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?
# My Note: Ruby's uniq method makes this easy and efficient

def distinct_powers(a_limit, b_limit)
  (2..a_limit).map { |a|
    (2..b_limit).map {|b| a**b}
  }.flatten.uniq.count
end

puts distinct_powers(100, 100)