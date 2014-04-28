# Find the sum of all the primes below two million.
#
# My Notes:
# - Here are three ways to sum all primes below an arbitrary limit.
# - The first uses the Sieve of Eratosthenes, which is by far the fastest
#   way to generate prime numbers.
# - The second uses the more intuitive method of checking each number upto
#   the limit for primality, with the slight optimization of checking only
#   odd numbers above 2, but is by far the slowest ~23 seconds
# - The third uses Ruby's Prime class prime number generator, which according
#   to the documentation uses Eratosthenes' method, but is still about five
#   times slower than the sieve I've written.

########Sieve of Eratosthenes#########
beginning = Time.now

def find_primes_upto(n)
  list = (2..n).to_a
  2.upto(n/2) do |p|
    (2*p-2..n-2).step(p){ |i| list[i] = 0 } unless list[p-2] == 0
  end
  list
end

puts find_primes_upto(2_000_000).reduce(:+)

puts "Sieve time: #{Time.now - beginning} seconds"
puts

########Checking Primes Manually##########
beginning = Time.now

def is_prime?(n)
  2.upto(Math.sqrt(n).to_i) { |d| return false if n % d == 0 }
  n == 1 ? false : true
end

lim = 2_000_000
puts (3..lim).step(2).map{|p| is_prime?(p) ? p : 0}.reduce(:+)+2

puts "Manual prime time: #{Time.now - beginning} seconds"
puts

########Ruby's Prime Number Generator#########
beginning = Time.now
require 'prime'

lim = 2_000_000
puts Prime.each(lim).reduce(:+)

puts "Ruby Prime time: #{Time.now - beginning} seconds"
puts

