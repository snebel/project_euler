# Comparing two numbers written in index form like 211 and 37 is not difficult, as
# any calculator would confirm that 211 = 2048 < 37 = 2187.
#
# However, confirming that 632382518061 > 519432525806 would be much more difficult,
# as both numbers contain over three million digits.
#
# Using base_exp.txt, a 22K text file containing one thousand lines with a 
# base/exponent pair on each line, determine which line number has the greatest
# numerical value.
#
# My Notes:
# - Given two base-exponent pairs, we can make their bases equivalent by taking the
#   log of both bases and multiplying the logs by the exponents. We can then 
#   compare the exponents directly to compare the numbers

def compare(pair1, pair2) # each pair in the form [base, exponent]
  Math.log(pair1[0]) * pair1[1] > Math.log(pair2[0]) * pair2[1]
end

pairs = File.readlines('./files/base_exp.txt').map do |line| 
  line.split(',').map(&:to_i)
end

max = pairs[0]
pairs.each{ |pair| max = pair if compare(pair, max) }

p max
p pairs.index(max) + 1
