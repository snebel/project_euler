# What is most surprising is that the important mathematical constant,
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].
#
# The first ten terms in the sequence of convergents for e are:
# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.
#
# Find the sum of digits in the numerator of the 100th convergent of the continued fraction for e.
#
# My Notes:
# - We can write a recursive method to find the nth convergent of e, with a simple conditional to 
#   find the appropriate denominator
# - The recursion for the nth convergent works as follows:
#   Return 0 when n = 1, otherwise for each i between 2 and n, continuously add 1/d(i) to the
#   deepest denominator of the fraction (where d(i) is the appropriate denominator). 

def nth_convergent(n, i = 2)
  return 0 if n == 1
  d = i % 3 == 0 ? i/3 * 2 : 1
  Rational(1, d + nth_convergent(n - 1, i + 1))
end

p ans = 2 + nth_convergent(100)
p ans.numerator.to_s.chars.map(&:to_i).inject(:+)
