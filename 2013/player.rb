class Player

  attr_reader :rating, :results, :name

  def initialize (name, rating, results)
    @name = name
    @rating = rating
    @results = results
  end

  def total_score
    @results.inject(0) {|total, result| total + result}
  end

  def opponent_rating (opponents)
    total = 0
    opponents.each do |player|
      if player.name != @name
        total += player.rating
      end
    end
    total / (opponents.length - 1.00)
  end

  def expected_score (opponents)
    power = (opponent_rating(opponents) - @rating)/400

    1.00/(1 + (10 ** power))
  end


  def new_rating(opponents)
    @rating + 40 * (total_score - @results.length * expected_score(opponents))
  end

  def to_s
    s = "#{@name}\t#{@rating}"
    s = @results.inject(s) {|str, result| str += " " + result.to_s}
    s += " TOTAL: #{total_score}"
  end
end