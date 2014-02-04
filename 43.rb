# The number, 1406357289, is a 0 to 9 pandigital number because it is
# made up of each of the digits 0 to 9 in some order, but it also has
# a rather interesting sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way,
# we note the following:
#
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# 
# Find the sum of all 0 to 9 pandigital numbers with this property.
#
# My Notes:
# - By far my lengthiest answer so far, but the algorithm is pretty simple:
#   (1) Create 3 arrays of 3-digit numbers representing the valid possibilities
#       for d2-d4, d5-d7, and d8-d10.
#   (2) To narrow down the options, make an array of all valid possibilities of
#       d5-d10 by combining those two arrays and selecting only numbers that also
#       match the criteria for d6d7d8 and d7d8d9.
#   (3) With this new array of candidates, repeat the process by adding on each of
#       d2-d4 to each candidate and selecting only numbers in the new list that match
#       the criteria for d3d4d5 and d4d5d6.
#   (4) We will now have a list of 9-digit numbers with unique digits matching the
#       criteria for d2-d10.
#   (5) Lastly, tack on the missing digit to each of the final candidates and sum the list
# - This program runs in about 0.06 seconds

class Array
  def remove_dupes!
    self.select! do |n| 
      chars = n.to_s.chars
      chars.size == chars.uniq.size
    end
  end

  def select_first_segments!(div_1, div_2)
    self.select! do |n| 
      s = n.to_s
      first, last = s[1..3].to_i, s[2..4].to_i
      first % div_1 == 0 && last.to_i % div_2 == 0
    end
  end
end 

def make_3_dig_mults(step)
  start = step * (100/step + 1)
  (start..999).step(step).to_a.remove_dupes!
end

def combine(first, last)
  candidates = []
  first.each do |x|
    last.each do |y|
      candidates << (x.to_s + y.to_s).to_i
    end
  end
  candidates.remove_dupes!
end


d2d3d4 = make_3_dig_mults(2)
d5d6d7 = make_3_dig_mults(7)
d8d9d10 = make_3_dig_mults(17)

candidates = combine(d5d6d7, d8d9d10)
candidates.select_first_segments!(11, 13)

candidates = combine(d2d3d4, candidates)
candidates.select_first_segments!(3, 5) 

final_candidates = []
candidates.each do |n|
  s = n.to_s
  missing = (['1','2','3','4','5','6','7','8','9'] - s.chars).first
  final_candidates << "#{missing}#{s}".to_i
end

puts final_candidates.reduce(:+)






