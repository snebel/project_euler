# We shall call a positive integer that is neither increasing nor decreasing a "bouncy"
# number; for example, 155349.
#
# Just over half of the numbers below one-thousand (525) are bouncy. In fact, the least
# number for which the proportion of bouncy numbers first reaches 50% is 538.
#
# Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 
# the proportion of bouncy numbers is equal to 90%.
#
# Find the least number for which the proportion of bouncy numbers is exactly 99%.
#
# My Notes:
# - A number is bouncy if it is neither increasing nor decreasing. We can use this property to
#   write a method for checking if a number is bouncy indirectly.

def bouncy?(n)
  chars = n.to_s.chars
  sorted_chars = chars.sort
  chars != sorted_chars && chars.reverse != sorted_chars
end

def first_number_with_bouncy_proportion(p)
  bouncies, num = 0.0, 99
  while bouncies / num < p
    bouncies += 1 if bouncy?(num += 1)
  end
  num
end

p first_number_with_bouncy_proportion(0.9)