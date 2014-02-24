# If we list all the natural numbers below 10 that are multiples of
# 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
#
# My Notes:
# - Here's a demonstration of four different ways to solve this problem in order of efficiency

require 'benchmark'
require 'set'

iterations = 1_000

Benchmark.bmbm do |bm|

  bm.report("set") do 
    iterations.times do
      a = Set.new((0..1000).step(3))
      b = Set.new((0..1000).step(5))
      a.union(b).reduce(:+)
    end
  end

  bm.report("array") do
    iterations.times do
      a = (0..999).step(3).to_a
      b = (0..999).step(5).to_a
      (a | b).reduce(:+)
    end
  end

  bm.report("sum") do
    iterations.times do
      sum = 0
      1000.times do |n|
        sum += n if n % 5 == 0 || n % 3 == 0
      end
    end
  end

  bm.report("range") do
    iterations.times do
      sum = 0
      (0...1000).step(3) {|n| sum += n}
      (0...1000).step(5) {|n| sum += n unless n % 3 == 0}
    end
  end
end
