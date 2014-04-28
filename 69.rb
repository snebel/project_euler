# Euler's Totient function, φ(n) [sometimes called the phi function], is used to
# determine the number of numbers less than n which are relatively prime to n
#
# Find the value of n ∏(1 - 1/p) for which n/φ(n) is a maximum.
#
# My Notes:
# - We can analyze Euler's formula for calculating phi(n) to solve this problem.
# - phi(n) = n * ∏(1 - 1/p) for each p that divides n, and we are trying to
#   maximize n / phi(n) => 1 / ∏(1 - 1/p)
# - This means we want the denominator ∏(1 - 1/p) to be as small as possible
# - (1 - 1/p) will be a decimal < 1 for every p, and (1 - 1/p) will always be larger
#   for larger values of p.
# - Therefore, we're looking for n ≤ 1,000,000 with the most unique and smallest
#   prime factors possible.
# - So simply given a limit, we can use a prime generator to multiply small primes together
#   until we get a maximal product of primes below the limit.

require 'prime'

def generate_n(lim, n = 1, p = Prime::EratosthenesGenerator.new)
  prime = p.next
  n * prime < lim ? generate_n(lim, n*prime, p) : n
end

p generate_n(1_000_000)