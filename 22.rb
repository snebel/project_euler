# What is the total of all the name scores in the file names.rb?

require_relative './files/names'

def name_score(name, i)
  name.chars.map{|c| c.ord - 64}.reduce(:+) * i
end

@names.sort!
p (0..@names.size-1).map{|i| name_score(@names[i], i+1)}.reduce(:+)
