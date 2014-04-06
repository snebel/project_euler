# Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine the
# number of positive numbers less than or equal to n which are relatively prime to n. 
# Interestingly, φ(87109)=79180, and it can be seen that 87109 is a permutation of 79180.
#
# Find the value of n, 1 < n < 107, for which φ(n) is a permutation of n and the ratio
# n/φ(n) produces a minimum.
#
# My Notes:
# - We can use some facts about Euler's Totient function to help us:
#   (1) if two numbers m and n are relatively prime, then φ(m*n) = φ(m)*φ(n)
#   (2) φ(n) reaches a maximum of n - 1 whenever n is prime
# - n/φ(n) will produce a minimum when φ(n) is large relative to n. Therefore, the optimal scenario
#   is when n is prime and φ(n) = n - 1. However, in this case, φ(n) will never be a permuation of n
#   since subtracting 1 from an odd number n will only change the last digit.
# - The next best scenario would be when n can be written as the product of two primes. Two primes
#   are always relatively prime since they can share no factors besides 1. So if n = p1 * p2,
#   φ(n) = φ(p1*p2) = φ(p1) * φ(p2) by (1) = (p1 - 1) * (p2 - 1) by (2).
# - Therefore, we should consider prime pairs multiplying to n below 10,000,000 and see if φ(n)
#   is ever a permutation of n.
# - I took a guess that we didn't need to consider primes above √15,000,000 as the minimum ratio
#   will occur when p1 and p2 are close to √10,000,000

require 'prime'

primes = Prime.take_while{|p| p < Math.sqrt(15_000_000)}
hash = {}

primes.each do |p1|
  primes.each do |p2|
    n = p1 * p2
    next if n > 10_000_000
    phi = (p1 - 1) * (p2 - 1)
    hash[n] = n.to_f/phi if n.to_s.chars.sort == phi.to_s.chars.sort
  end
end

p min_ratio = hash.values.min
p hash.key(min_ratio)