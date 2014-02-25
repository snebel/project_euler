class Hand
  include Comparable
  attr_reader :cards, :vals
  def initialize(cards)
    @cards = cards
    @vals = @cards.map{|c| c.val}
  end

  def straight_flush?
    flush? && straight?
  end

  def flush?
    @vals.uniq.size == 1
  end

  def straight?
    vals = @vals.sort
    (vals.first..vals.last).to_a == vals
  end

  def four?
    @vals.select{|e| @vals.count(e) == 4 }.size == 4
  end

  def full_house?
    three? && one_pair?
  end

  def three?
    @vals.select{|e| @vals.count(e) == 3 }.size == 3
  end

  def two_pair?
    @vals.select{|e| @vals.count(e) == 2 }.size == 4
  end

  def one_pair?
    @vals.select{|e| @vals.count(e) == 2 }.size == 2
  end

  def eval
    return 0 if straight_flush?
    return 1 if four?
    return 2 if full_house?
    return 3 if flush?
    return 4 if straight?
    return 5 if three?
    return 6 if two_pair?
    return 7 if one_pair?
    return 8
  end

end