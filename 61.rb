# Find the sum of the only ordered set of six cyclic? 4-digit numbers for which each
# polygonal type: triangle, square, pentagonal, hexagonal, heptagonal, and octagonal, 
# is represented by a different number in the set.
#
# My Notes:
# - The algorithm is as follows:
#   - Find all the desired polygonal numbers
#   - Create a hash where the value corresponding to each polygonal number is an array
#     of polygonal numbers cyclic to it of a different type
#   - Start with a key in the hash and form a chain by following the possible numbers
#     through the hash to see if a complete cyclic chain of 6 can be formed with different
#     types of polygons

def cyclic?(arr)
  arr.each_with_index.map do |e, i|
    e / 100 == arr[i-1] % 100
  end.inject(:&)
end

# we label each polygonal number with as [value, #sides]
polys = (1..150).map{|n| [n*(n + 1)/2, 3]}.select{|n| n[0] > 1_000 && n[0] < 10_000} +
  (1..100).map{|n| [n**2, 4]}.select{|n| n[0] > 1_000 && n[0] < 10_000} +
  (1..100).map{|n| [n*(3*n - 1)/2, 5]}.select{|n| n[0] > 1_000 && n[0] < 10_000} +
  (1..100).map{|n| [n*(2*n - 1), 6]}.select{|n| n[0] > 1_000 && n[0] < 10_000} +
  (1..100).map{|n| [n*(5*n - 3)/2, 7]}.select{|n| n[0] > 1_000 && n[0] < 10_000} +
  (1..100).map{|n| [n*(3*n - 2), 8]}.select{|n| n[0] > 1_000 && n[0] < 10_000}

hash = {}

polys.each do |poly|
  hash[poly] = polys.select{|n| poly[0]%100 == n[0]/100 && n[1] != poly[1]}
end

hash.each do |poly, vals|
  vals.each do |n|
    hash[n].each do |o|
      hash[o].each do |p|
        hash[p].each do |q|
          hash[q].each do |r|
            chain = [poly, n, o, p, q, r]
            vals = chain.map(&:first)
            if cyclic?(vals) && chain.map(&:last).sort == Array(3..8)
              p vals
              p vals.reduce(:+)
              exit
            end
          end
        end
      end
    end
  end
end
