
class Hand

  include Comparable

  def initialize
    @hand = []
  end

  def add_to_hand(card)
    @hand << card
  end

  def rank
    kinds = Hash.new(0)
    @hand.each do |card|
      kinds[card.kind] += 1
    end

    largest = 0
    kinds.each do |kind,value|
      if value > largest
        largest = value
      end
    end
    largest
  end

  def <=>(other)
    rank <=> other.rank
  end

  def to_s
    s = "["
    @hand.inject(s) {|str, card| str += card.to_s + ", "} + "]"
  end
end