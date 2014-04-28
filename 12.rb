# What is the value of the first triangular number to have over five hundred divisors?
#
# My Notes:
# - We can calculate the number of divisors of a number, n, by finding its prime
#   factorization and multiplying 1 greater than each exponent together.

require 'prime'

def divisors(n)  
  n.prime_division.map{|p| p[1] + 1}.reduce(:*)
end

def first_tri(limit)
  2.upto(Float::INFINITY) do |n| 
    tri = n * (n + 1) / 2
    return tri if divisors(tri) > limit
  end
end

p first_tri(500)