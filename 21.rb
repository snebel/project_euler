# Evaluate the sum of all the amicable numbers under 10000.
# My Note: a number x is amicable if d(d(x)) == x

def d(n)
  (2..Math.sqrt(n)).inject(1){|s, i| n % i == 0 ? s + i + n/i : s}
end

p (220..10_000).inject(0) { |s, n|
  d = d(n)
  d != n && d(d) == n ? s + n : s
}