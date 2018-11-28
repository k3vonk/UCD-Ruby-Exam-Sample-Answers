class Oracle

  include Comparable

  def initialize (range)
    @number = 1 + rand(range)
  end

  def is_it? (guess)
    @number <=> guess
  end

end