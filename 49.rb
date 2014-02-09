# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
# by 3330, is unusual in two ways: (i) each of the three terms are prime,
# and (ii) each of the 4-digit numbers are permutations of one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in this sequence?
#
# My Notes:
# - 1061 4-digit primes
# - arithmetic sequence differs by a constant amount
# - First find the primes who's permutations are also primes

require 'prime'

primes = []
1000.upto(9999).each{ |n| primes << n if Prime.prime?(n) }

permed_primes = []

primes.each do |prime|
  perms = prime.to_s.chars.permutation.to_a.map(&:join).map(&:to_i)
  perms.each{ |p| perms.delete(p) unless Prime.prime?(p) }
  permed_primes << perms.uniq
end

permed_primes.each do |seq|
  
end