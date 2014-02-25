# What is the largest prime factor of 600851475143 ?
#
# My Notes:
# - A demonstration using both ruby's Prime class and my own prime_factors method

def is_prime?(n)
  2.upto(Math.sqrt(n).to_i) { |num| return false if n % num == 0 }
  n == 1 ? false : true
end

def prime_factors(n, primes = [])
  return primes << n if is_prime?(n)
  (1..n).step(2) do |f|
    if n % f == 0 && is_prime?(f)
      return prime_factors(n/f, primes << f)
    end
  end
end

p prime_factors(600851475143).last

require 'benchmark'
require 'prime'

iterations = 1_000

Benchmark.bmbm do |bm|

  bm.report("ruby prime") do 
    iterations.times do 
      Prime.prime_division(600851475143)[-1][0]
    end
  end

  bm.report("my method") do 
    iterations.times do 
      prime_factors(600851475143).last
    end
  end
end