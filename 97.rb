# The first known prime found to exceed one million digits was discovered in 1999,
# and is a Mersenne prime of the form 26972593−1; it contains exactly 2,098,960 
# digits. Subsequently other Mersenne primes, of the form 2p−1, have been found
# which contain more digits.
#
# However, in 2004 there was found a massive non-Mersenne prime which contains
# 2,357,207 digits: 28433×27830457+1.
#
# Find the last ten digits of this prime number.
#
# My Notes:
# - To find the last n digits of an integer, x, all we need to do is x % 10**n.
#   Ruby's evaluation of Bignums allows for this large calculation 

def last_n_digits(x, n)
  x % 10**n
end

p last_n_digits(28433 * 2**7830457 + 1, 10)