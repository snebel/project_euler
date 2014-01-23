# Considering quadratics of the form: n² + an + b,
# where |a| < 1000 and |b| < 1000,
# Find the product of the coefficients, a and b, 
# for the quadratic expression that produces the 
# maximum number of primes for consecutive values
# of n, starting with n = 0.
# My Note: this is a brute force method

def is_prime?(n)
  return false if n < 2
  2.upto(Math.sqrt(n).to_i) { |num| return false if n % num == 0 }
  true
end

def consec_primes(a, b, n = 0, count = 0)
  val = n**2 + a*n + b
  is_prime?(val) ? consec_primes(a, b, n+1, count+1) : count
end

def max_consec_primes_coefficients(limit)
  nums = {}
  (-1*limit).upto(limit) do |a|
    (-1*limit).upto(limit) do |b|
      nums[consec_primes(a, b)] = [a, b]
    end
  end
  nums[nums.keys.max]
end

puts max_consec_primes_coefficients(999).reduce(:*)
