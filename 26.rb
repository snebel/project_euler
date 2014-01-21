# Find the value of d < 1000 for which 1/d contains
# the longest recurring cycle in its decimal fraction part.
# My note: only need to check odd numbers--evens don't repeat.

CYCLES = {}
# {cycle_length => divisor}
def find_recurring_cycle(divisor, quotient, remainders = [], length = 0)  
  if divisor > quotient
    find_recurring_cycle(divisor, quotient*10, remainders, length)
  else
    r = quotient % divisor
    if remainders.include?(r) or r == 0
      CYCLES[length] = divisor
      return
    end
    find_recurring_cycle(divisor, r, remainders + [r], length + 1)
  end
end

1.upto(498).map {|n| find_recurring_cycle(2*n + 1, 1) }
puts CYCLES[CYCLES.keys.max]
