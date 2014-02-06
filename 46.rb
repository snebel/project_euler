# It was proposed by Christian Goldbach that every odd composite number
# can be written as the sum of a prime and twice a square.
# 9 = 7 + 2×12
# 15 = 7 + 2×22
# 21 = 3 + 2×32
# 25 = 7 + 2×32
# 27 = 19 + 2×22
# 33 = 31 + 2×12
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum
# of a prime and twice a square?
#
# My Notes:
# - Need to check if an odd composite can be written as sum of a prime and twice a square
# - Given a number n, the possibilities for sqaures are all squares below n/2
# - If there is one such square, s, such that n - 2*s is prime, n meets Goldbach's conjecture.
# - We can check all odd composites for this property until we find one that fails

def prime?(n)
  2.upto(Math.sqrt(n).to_i) { |num| return false if n % num == 0 }
  n == 1 ? false : true
end

def list_squares_upto(limit)
  1.upto(Math.sqrt(limit).to_i).map{ |n| n**2 }
end

def check_odd_composites(n = 9)
  unless prime?(n)
    squares = list_squares_upto(n/2)
    return n if !squares.map{ |s| prime?(n - 2*s) }.reduce(:|)
  end
  check_odd_composites(n+2)
end

puts check_odd_composites
