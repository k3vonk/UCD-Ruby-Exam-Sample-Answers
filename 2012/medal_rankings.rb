class MedalRankings

  include Enumerable

  def initialize
    @countries = []
  end

  def add_countries(country)
    @countries << country
  end

  def most_gold
    @countries.max_by {|country| country.gold}.name
  end

  def total_pop
    @countries.inject(0){|pop, country| pop + country.population}
  end

  def sort!
    @countries.sort!
  end

  def each_medal_winner
    @countries.each{|country| yield country}
  end

  def to_s
    @countries.inject(""){|str, country| str += country.to_s + "\n"}
  end
end