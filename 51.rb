# By replacing the 1st digit of the 2-digit number *3, it turns out that six 
# of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit 
# number is the first example having seven primes among the ten generated numbers,
# yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. 
# Consequently 56003, being the first member of this family, is the smallest prime 
# with this property.
#
# Find the smallest prime which, by replacing part of the number (not necessarily 
# adjacent digits) with the same digit, is part of an eight prime value family.

require 'prime'

#first = 56993

def get_removable_indices(p)
  list = []
  num = p.to_s.size - 1
  (1..num).each do |n|
    (0..num-1).to_a.combination(n).each {|c| list << c }
  end
  list
end

def check_one_replacement(p, indices)#, n)
  # digits = [_, _, _, _, _]
  digits = p.to_s.chars.map(&:to_i)
  # indices = [2, 3]
  count = 0
  (0..9).each do |n|
    indices.each do |i| 
      digits[i] = n
    end
    int = digits.join
    count += 1 if Prime.prime?(int) && int.size == p.to_s.size  
  end
  count
end

def check_all_replacements(p)
  #digits = p.to_s.chars.map(&:to_i)
  indices_list = get_removable_indices(p)
  #p indices_list
  indices_list.each do |indices|
    return true if check_one_replacement(p, indices) == 8
  end
  false
end

#p get_removable_indices(1000)
#p check_one_replacement(56003, [2,3])
#p check_all_replacements(100109)

#primes = Prime.first(1_000_000) - Prime.each(56003).to_a

Prime.each do |prime|
  next if prime < 56000
  p prime
  if check_all_replacements(prime)
    p prime
    break
  end
end
