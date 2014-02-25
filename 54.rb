
class Card
  include Comparable

  VALS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  attr_reader :suit, :val

  def initialize(string)
    @val = string[0]
    @suit = string[1]
  end

  def <=>(other)
    VALS.index(self.val) <=> VALS.index(other.val)
  end
end

hands = File.readlines('./files/poker.txt').map do |line|
  hands = line.split
  make = proc {|c| Card.new(c)}
  [hands[0..4].map(&make), hands[5..9].map(&make)]
end


def flush?(hand)
  hand.map{|c| c.suit}.uniq.size == 1
end

def straight?(hand)
  vals = hand.map{|c| c.val}.sort
  (vals.first..vals.last).to_a == vals
end

def check_for_dups(hand)
  vals = hand.map{|c| c.val}
  array.select{|e| array.count(e) > 1 }
end

def full_house?(hand)
  three?(hand) && one_pair?(hand)
end

def three?(hand)
  dups = check_for_dups(hand)
  dups.select{|e| array.count(e) == 3 }.size == 1
end

def two_pair?(hand)
  dups.select{|e| array.count(e) == 2 }.uniq.size == 2
end

def one_pair?(hand)
  dups.select{|e| array.count(e) == 2 }.uniq.size == 1
end

def high_card(hand)
  
end

count == 0

hands.each do |game|
  (count += 1; next) if game[1]  
end

