# The number 3797 has an interesting property. Being prime itself, 
# it is possible to continuously remove digits from left to right,
# and remain prime at each stage: 3797, 797, 97, and 7. 
# Similarly we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable
# from left to right and right to left.
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'prime'

def left_stages(n, stages = [])
  unless n < 10
    s = n.to_s[1..-1].to_i
    left_stages(s, stages << s)
  end
  stages
end

def all_stages(n, right_stages = [])
  unless n < 10
    s = n.to_s[0..-2].to_i
    all_stages(s, right_stages << s)
  end
  right_stages + left_stages(n)
end

def truncatable?(n)
  all_stages(n).select {|i| !Prime.prime?(i)}.empty?
end

truncs = []
Prime.each {|p| truncs << p if truncatable?(p); break if truncs.count == 15}

puts (truncs.reduce(:+) - 17) # - 17 for 2, 3, 5, 7
