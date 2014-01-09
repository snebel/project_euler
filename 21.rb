# Evaluate the sum of all the amicable numbers under 10000.
# My Note: a number x is amicable if d(d(x)) == x

def get_proper_divisors(n)
  root = Math.sqrt(n) 
  divs = [1]
  2.upto(root.to_i) { |i| divs += [i, n/i] if n % i == 0 }
  root == root.to_i ? (divs - [root.to_i] + [root.to_i] - [n]) : (divs - [n])
end

# returns sum of proper divisors of n
def d(n)
	get_proper_divisors(n).reduce(:+)
end

def sum_amicables(limit)
	sum = 0
	2.upto(limit) { |n| sum += n if (d(d(n)) == n && d(n) != n); }
	sum
end

puts sum_amicables(10000)
