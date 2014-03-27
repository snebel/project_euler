# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.
#
# My Notes:
# - From the Wikipedia page "Square Number":
#   - If the last digit of a number is 0, its square ends in an even number of 0s (so at least 00)
#     and the digits preceding the ending 0s must also form a square.
#   - If the last digit of a number is 1 or 9, its square ends in 1 and the number formed by its
#     preceding digits must be divisible by four.
#   - If the last digit of a number is 2 or 8, its square ends in 4 and the preceding digit must be even.
#   - If the last digit of a number is 3 or 7, its square ends in 9 and the number formed by its 
#     preceding digits must be divisible by four.
#   - If the last digit of a number is 4 or 6, its square ends in 6 and the preceding digit must be odd.
#   - If the last digit of a number is 5, its square ends in 25 and the preceding digits must be 0, 2,
#     06, or 56.
# - Since our square, n^2, must end in 0, we can deduce from these rules that n must
#   end in 0 and n^2 must end in 00.
# - The first rule tells us that the digits preceding the trailing 0s also form a square.
#   We can therefore just look for a number n such that n^2 = 1_2_3_4_5_6_7_8_9. n*10 will
#   give the desired n^2 ending in 00.
# - The smallest n such that n^2 is a 17-digit number is 100,000,000. n must also end in 3 or 7
# - Therefore, we can start with the number 1,000,000,003 and check each subseqent number
#   ending in 3 or 7 for a square matching the desired form.
# - Again, the length of this code is not indicative of how much time I spent on it.

n = 100_000_003

until /1.2.3.4.5.6.7.8.9/ =~ (n**2).to_s
  n % 10 == 3 ? n += 4 : n += 6
end

puts "#{n}^2 = #{n**2}, so #{n}0^2 = #{n**2}00"