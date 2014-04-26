# The cube, 41063625 (3453^3), can be permuted to produce two other cubes: 56623104 (3843^3) 
# and 66430125 (4053^3). In fact, 41063625 is the smallest cube which has exactly three
# permutations of its digits which are also cube.
#
# Find the smallest cube for which exactly five permutations of its digits are cube.
#
# My Notes:
# - Let's make the assumption that the cube is within the first 10,000 cubes
# - We can list the cubes upto the first 10,000th cube along with a sorted array of
#   each cube's digits. Two cubes will be permutations of each other if these
#   arrays are equal.
# - The length of this code is NOT indicative of how much time I spent on this problem
# - Runs in ~11sec

cubes = (406..10_000).map{|i| [i**3, (i**3).to_s.chars.sort] }

cubes.each do |c1|
	if cubes.count{|c2| c1[1] == c2[1]} == 5
    p c1[0] 
    break
  end
end