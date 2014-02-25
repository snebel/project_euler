# Starting with 69 produces a chain of five non-repeating terms, but the longest
# non-repeating chain with a starting number below one million is sixty terms.
#
# How many chains, with a starting number below one million, contain exactly 
# sixty non-repeating terms?
#
# My Notes:
# - Brute-forced it. Takes a while.
# - Optimization note: A number number x whose digits are a permutation of the digits
#   of number y will have the same chain as y. 

class Fixnum
  def fact(prod = 1)
    self <= 1 ? prod : (self-1).fact(self * prod) 
  end
end

def iteration(n)
  n.to_s.chars.map(&:to_i).map(&:fact).reduce(:+)
end

count = 0

1.upto(1_000_000) do |n|
  endpoints = []
  until endpoints.include?(n)
    endpoints << n
    n = iteration(n)
  end
  count += 1 if endpoints.count >= 60
end

p count
