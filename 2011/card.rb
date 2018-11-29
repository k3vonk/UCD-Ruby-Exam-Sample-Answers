SUIT = [:DIAMONDS,:HEARTS,:CLUBS,:SPADES]
KIND = [:ACE,:TWO,:THREE,:FOUR,:FIVE,:SIX,:SEVEN,:EIGHT,:NINE,:TEN,:JACK,:QUEEN,:KING]

class Card

  attr_reader :kind, :suit

  def initialize(suit, kind)
    @suit = suit
    @kind = kind
  end

  def is_equal?(suit, kind)
    @kind == kind && @suit == suit
  end

  def ==(other)
    @kind == other.kind
  end

  def generate_random
    @suit = SUIT[rand(SUIT.length)]
    @kind = KIND[rand(KIND.length)]
  end

  def to_s
    "#{@kind} of #{@suit}"
  end
end