class Card
  include Comparable

  VALS = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
  attr_reader :suit, :val

  def initialize(string)
    @val = string[0]
    @suit = string[1]
  end

  def <=>(other)
    VALS.index(self.val) <=> VALS.index(other.val)
  end
end