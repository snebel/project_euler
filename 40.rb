# An irrational decimal fraction is created by concatenating the positive integers:
# 0.123456789101112131415161718192021...
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the
# following expression: d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
#
# My Notes:
# - Spent a lot of time analyzing base-10 digit patterns before deciding to
#   go the simple route with this dumb one-liner.
# - Total Digits of Every Number of Each Length:
#   1: 1*9 = 9
#   2: 2*90 = 180
#   3: 3*900 = 2,700
#   4: 4*9,000 = 36,000
#   5: 5*90,000 = 450,000
#   n: n*9*10**(n-1)

def d(n)
  Array(1..n).join[n-1].to_i
end

p (0..6).inject(1){|ans, i| ans * d(10**i)}