# Find the sum of all the positive integers which cannot
# be written as the sum of two abundant numbers.
# My Note: find all abundant #s below limit, use nested 
# loops to find all sums, subtract from array of pos. integers.

def sum_proper_divisors(n)
  root = Math.sqrt(n) 
  sum = 1
  2.upto(root.to_i) { |i| sum += (i + n/i) if n % i == 0 }
  root == root.to_i ? (sum - root.to_i) : sum
end

def find_non_abundant_sums(limit)
  abundants = (1.upto(limit).map { |n| n if sum_proper_divisors(n) > n } - [nil])
  abundant_sums = []

  abundants.each do |x|
    abundants.each { |y| abundant_sums << (x+y) }
    abundants -= [x]
  end

  1.upto(28123).map {|n| n} - abundant_sums.uniq
end

puts find_non_abundant_sums(28123).reduce(:+)
