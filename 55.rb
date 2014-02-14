# If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.
# Not all numbers produce palindromes so quickly. For example,
# 349 + 943 = 1292,
# 1292 + 2921 = 4213
# 4213 + 3124 = 7337
# That is, 349 took three iterations to arrive at a palindrome.
#
# Although no one has proved it yet, it is thought that some numbers, like 196,
# never produce a palindrome. A number that never forms a palindrome through
# the reverse and add process is called a Lychrel number. For the purpose of this
# problem, we shall assume that a number is Lychrel until proven otherwise.
# In addition you are given that for every number below ten-thousand, 
# it will either (i) become a palindrome in less than fifty iterations, or, 
# (ii) no one, with all the computing power that exists, has managed so far to map 
# it to a palindrome. In fact, 10677 is the first number to be shown to require 
# over fifty iterations before producing a palindrome: 
# 4668731596684224866951378664 (53 iterations, 28-digits).
#
# How many Lychrel numbers are there below ten-thousand?
#
# My Notes:
# - Let an iteration be defined as adding the reverse of a number to itself
# - A number is a Lychrel if it takes more than 50 iterations to produce a palindrome

def palindrome?(n)
  n.to_s == n.to_s.reverse
end

def lychrel?(n, count = 0)
  return true if count == 50
  n += n.to_s.reverse.to_i
  palindrome?(n) ? false : lychrel?(n, count+1)
end

count = 0
(1..10_000).each do |n|
  count += 1 if lychrel?(n)
end

puts count
