class Player
  attr_reader :counter
  def initialize (name, oracle, range)
    @name, @oracle, @range = name, oracle, range
  end

  def guess
    value = number_guess
    condition(value)
    @oracle.is_it?(value)
  end

  def count(guesses)
    @counter = guesses
  end

  def to_s
    "#{@name}\n"
  end
end