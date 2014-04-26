# A number chain is created by continuously adding the square of the digits in a 
# number to form a new number until it has been seen before.
# For example,
# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
#
# Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop.
# What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
#
# How many starting numbers below ten million will arrive at 89?
#
# My Notes:
# - Keep a hash of all previously checked numbers and whether they go to 1 or 89
# - At each step in the chain, check if that number is already in the hash. If it
#   is, we know at which value the chain will end up
# - This works, and is a lot faster than pure brute force, but is still slow, ~90s

HASH = {1 => 1, 89 => 89}

def iteration(n)
  digits = n.to_s.chars.map(&:to_i)
  digits.map g{|c| c**2}.reduce(:+)
end

def check_num(n, steps = [])
  result = HASH[n]
  if result
    steps.each{ |x| HASH[x] = result }
    return result
  else
    next_int = iteration(n)
    check_num(next_int, steps << next_int)
  end
end

p (1..10_000_000).count{|n| check_num(n) == 89}
