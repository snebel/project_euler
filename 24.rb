# What is the millionth lexicographic permutation
# of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
# My Notes:
# -For each digit, there are 9! permutations starting with that digit
# -To find the nth permutation, we can consider just permutations
#  starting with n / 9! = 362880

def factorial(n, prod = 1)
  n == 1 ? prod : factorial(n-1, n*prod)
end

# returns the nth lexicographic permutation of digits
def lex_permutation(n, digits)
  fact = factorial(digits.size-1)
  lead_digit = n / fact
  count = lead_digit * fact
  perms = (digits - [lead_digit]).permutation.to_a
  ([lead_digit] + perms[n - count - 1]).join
end

puts lex_permutation(1000000, [0,1,2,3,4,5,6,7,8,9])
