# How many fractions lie between 1/3 and 1/2 in the sorted set of reduced
# proper fractions for d ≤ 12,000?

def proper_fractions_between(lower, upper, limit)
  fracs = []
  (2..limit).each do |d|
    min_n = d * lower.numerator / lower.denominator + 1
    max_n = d * upper.numerator / upper.denominator
    min_n.upto(max_n) {|n| fracs << Rational(n, d)}
  end
  fracs.uniq
end

fracs = proper_fractions_between(Rational(1,3), Rational(1,2), 12_000)
p fracs.count - 1 # - 1 accounts for removing 1/2