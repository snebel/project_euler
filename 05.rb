# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?
#
# My Notes:
# - We need to find the least common multiple of multiple numbers.
# - We can do this by listing the numbers, finding the lcm, l, of the first two numbers,
#   then setting l to the lcm of l and the next number in the list, and repeating the
#   process until the end of the list is reached.
# - To find the lcm of 1,...,n we can just find the lcm of n/2 + 1,...,n since every
#   number in the former list must be a factor of a number in the latter list.

# Euclid's algorithm for gcd
def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end

def lcm(a, b)
  (a * b) / gcd(a, b)
end

p (11..20).reduce(&:lcm)