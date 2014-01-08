# What is the value of the first triangular number to have over five hundred divisors?

#returns number of divisors of n
def num_divisors(n)
  root = Math.sqrt(n) 
  num = 2
  2.upto(root.to_i) { |i| num += 2 if n % i == 0 }
  root == root.to_i ? (num - 1) : num
end

# returns the nth triangular number
def calc_nth_tri(n)
	sum = (n+1)*(n/2)
	n % 2 == 0 ? sum : sum + (n+1)/2
end

# returns the first triangular number
# with more divisors than divs_limit
def first_tri(divs_limit)
	1.upto(Float::INFINITY) do |n| 
		num = calc_nth_tri(n)
		return num if num_divisors(num) > divs_limit
	end
end

puts first_tri(500)
