# How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100,
# are greater than one-million?

class Fixnum
  def fact(ans = 1)
    self <= 1 ? ans : (self-1).fact(self * ans)
  end

  def choose(r)
    self.fact / (r.fact * (self-r).fact)
  end
end

count = 0

1.upto(100) do |n|
  1.upto(n) do |r|
    count += 1 if n.choose(r) > 1_000_000
  end
end

p count