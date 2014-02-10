# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?

require 'linguistics'

Linguistics.use(:en)

a = (1..1000).map {|n| n.en.numwords.gsub(' ', '').gsub('-', '').size}
puts a.reduce(:+)