# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
# number, 134217728=8^9, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?
#
# My Notes:
# - Given an n, we need to to check j^n for all natural numbers
#   j until j^n is larger than the largest n-digit number
# - We can initially let j = log(base n)(10^(n-1)) fore each n

def count_n_digit_powers(n)
  min = 10**(n-1)
  j = (Math.log(min, n)+1).to_i
  power = j**n
  count = 0
  while  power <= 10**n
    count += 1
    power = j**n
    j += 1    
  end 
  count
end

def sum_num_n_digit_powers(n = 2, sum = 0)
  c = count_n_digit_powers(n)
  c == 0 ? sum : sum_num_n_digit_powers(n + 1, sum + c)
end

p sum_num_n_digit_powers
