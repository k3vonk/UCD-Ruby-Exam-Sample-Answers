require_relative 'card.rb'

class Pack
  def initialize
    @cards = []
    SUIT.length.times do |suit|
      KIND.length.times do |kind|
        @cards.push(Card.new(SUIT[suit], KIND[kind]))
      end
    end
  end

  def add_card(card)
    @cards << card
  end

  def remove_card(index)
    card = @cards[index]
    @cards.delete_at(index)
    card
  end

  def pick_random
    remove_card(rand(@cards.length))
  end

  def deal_hand(hand)
    5.times {hand.add_to_hand(pick_random)}
  end
end