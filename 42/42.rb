# The nth term of the sequence of triangle numbers is given by
# tn = ½n(n+1); so the first ten triangle numbers are:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ... 
#
# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. 
# For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. 
# If the word value is a triangle number then we shall call the word a triangle word.
#
# Using words.rb, a 16K text file containing nearly two-thousand common 
# English words, how many are triangle words?
#
# My Notes:
# - x is triangular if and only if for some n, n*(n+1)/2 == x
# - Can get a capital letter's number value in Ruby by calling 'A'.ord - 64 => 1
# - Need a method for determining if a number is a triangle number
# - Then we can use a method for combining letter values of a word and iterate 
#   over the list of words.

require_relative('words')

def triangle?(x)
  1.upto(x){ |n| return true if n*(n+1)/2 == x }
  false
end

class String
  def sum_char_vals
    self.chars.map{ |c| c.ord - 64 }.reduce(:+)
  end
end

def count_triangular_words(words)
  words.map{ |w| triangle?(w.sum_char_vals) ? 1 : 0}.reduce(:+)
end

puts count_triangular_words(@words)
