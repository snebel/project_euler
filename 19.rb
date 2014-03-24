# 1 Jan 1900 was a Monday.
#
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?
#
# My Notes:
# - Our approach will be to go through the days of the century in a linear way,
#   pausing at the first day of each month to determine if it was a Sunday
# - 1 Jan 1900 was a Monday and had 365 days (since not divisible by 400), so 1 Jan 1901 
#   was a Tuesday since 365 % 7 is 1
# - We let the first day of the century (Tuesday) be day 2. This way we can index sundays by
#   multiples of 7 (if the current day is divisible by 7, we'll know it was a Sunday)

months = {
  jan: 31, feb: 28, mar: 31, apr: 30,
  may: 31, jun: 30, jul:31 , aug: 31,
  sep: 30, oct: 31, nov: 30, dec: 31
}

current_day = 2
count = 0

(1901..2000).each do |year|
  year % 4 == 0 ? months[:feb] = 29 : months[:feb] = 28
  months.each do |month, num_days|
    count += 1 if current_day % 7 == 0
    current_day += num_days
  end
end

p count