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
# - We can start with each 4-digit prime and check for an arithmetic sequence as follows:
#   (1) Given p, generate a sorted list of all prime permutations of the digits of p
#   (2) Take this list and find all combinations of 3 increasing elements
#   (3) Check to see if any of these combinations is an arithmetic sequence
# - Surprising to find that terms of the answer as well as the prime arithmetic
#   sequence 379, 3709, 7039 also differ by 3300

require 'prime'

def primes(low, high)
  Prime.each(high).to_a.select{|p| p > low}
end

def arithmetic_sequence(p)
  perms = p.to_s.chars.permutation.map(&:join).map(&:to_i).uniq
  perms.select!{|p| Prime.prime?(p)}
  seqs = perms.combination(3).map{ |p| p.sort }
  seqs.each{ |seq| return seq if seq[2] - seq[1] == seq[1] - seq[0] }
  []
end

p primes(1000, 9999).map{|p| arithmetic_sequence(p)}.uniq
