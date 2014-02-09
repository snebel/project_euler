# The prime 41 can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# The longest sum of consecutive primes below one-thousand that adds to a prime
# contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
#
# My Notes:
# - The maximum possible value of the smallest prime in a consecutive sequence summing
#   to p that is at least 22 terms is p/22.
# - So for each p, the only candidates for the first additive factor are all the
#   primes upto p/22
# - For brevity, lets make the assumption that the longest such sequence will begin
#   with a prime below 100 (if not, we can check more)
# - The algorithm is as follows: Given p,
#   (1) list all primes upto p/22 (in our case all primes below 100)
#   (2) for each member of this list, s, sum consecutive primes starting with s,
#       keeping track of both the sum and the length of the sequence
#   (3) if the sum is prime, store the sum and the length of the sequence in a hash
#   (4) move on to a sequence beginning with the next s when the sum exceeds 1,000,000

require 'prime'

def next_prime(p)
  return 3 if p == 2
  n = p + 2
  Prime.prime?(n) ? n : next_prime(n) 
end

def longest_prime_sum_seq_below(limit)
  steps = {}
  Prime.each(100).each do |p|
    count = 1
    sum = p
    while sum < limit
      steps[sum] = count if Prime.prime?(sum) && !steps[sum]
      p = next_prime(p)
      sum += p
      count += 1
    end
  end
  steps
end

h = longest_prime_sum_seq_below(1_000_000)
puts h.values.max # the largest prime
puts h.key(h.values.max) # number of primes in the sequence

