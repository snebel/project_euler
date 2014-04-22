# How many continued fractions for N ≤ 10000 have an odd period?
#
# My Notes:
# - 'find_period_one' mimics the process shown in the problem, and works well for samle
#   input, but produces the wrong answer overall. My guess is that using floats rather
#   than proper square roots and rationals leads to rounding errors with larger inputs.
# - 'find_period_two' uses the process detailed in the Wikipedia page
#   'Methods_of_computing_square_roots#Continued_fraction_expansion' and works fast

def find_period_one(n)
  x = Math.sqrt(n).to_i
  frac = Math.sqrt(n) - x
  p = [x]
  until p[-1] == 2 * p[0]
    frac = 1 / frac
    x = frac.to_i
    frac -= x
    p << x
  end
  p.size - 1
end

def find_period_two(s)
  a0 = Math.sqrt(s).to_i
  per_length = 0
  m = 0
  d = 1
  a = a0
  until a == 2 * a0
    m = d * a - m
    d = (s - m**2) / d
    a = (a0 + m) / d
    per_length += 1
  end
  per_length
end

non_squares = Array(1..10_000) - (1..100).map{|n| n**2}
count = 0
non_squares.each{|n| count += 1 if find_period_two(n).odd?}
p count