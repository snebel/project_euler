# The file, poker.txt, contains one-thousand random hands dealt to two players.
# Each line of the file contains ten cards.the first five are Player 1's cards and 
# the last five are Player 2's cards.
#
# How many hands does Player 1 win?
#
# My Notes:
# - I've created a Card class that include ruby's comparable module, and  Hand class
#   that contains five cards and has methods for classifying and evaluating a hand
# - The only "ties" that occur for the 1000 games are when both players have one pair,
#   or both players have a high card. I evaluate which hand is better in those instances
#   in the loop below.

require_relative './files/card.rb'
require_relative './files/hand.rb'

hands = File.readlines('./files/poker.txt').map do |line|
  cards = line.split
  make = proc {|c| Card.new(c)}
  hand1 = cards[0..4].map(&make)
  hand2 = cards[5..9].map(&make)
  [Hand.new(hand1), Hand.new(hand2)]
end

player1_wins = 0

hands.each do |game|
  hand1, hand2 = game[0], game[1]
  p1, p2 = hand1.eval, hand2.eval

  if p1 < p2
    player1_wins += 1
  elsif p1 == p2 && p1 == 8
    player1_wins += 1 if hand1.cards.max > hand2.cards.max
  elsif p1 == p2 && p1 == 7
    p1_pair_val = hand1.cards.select{|c| hand1.vals.count(c.val) == 2}[0]
    p2_pair_val = hand2.cards.select{|c| hand2.vals.count(c.val) == 2}[0]
    player1_wins += 1 if p1_pair_val > p2_pair_val
  end
end

p player1_wins