class Country

  attr_reader :gold, :name, :population

  include Comparable

  def initialize (name, gold, silver, bronze, population)
    @name = name
    @gold = gold
    @silver = silver
    @bronze = bronze
    @population = population
  end

  def ranking
    (@gold*3 + @silver*2 + @bronze) / (@population.to_f)
  end

  def <=>(other)
    self.ranking <=> other.ranking
  end

  def has_medal?
    @gold > 0 || @silver > 0 || @bronze > 0
  end

  def to_s
    "#{@name}, #{@gold}, #{@silver}, #{@bronze}, #{@population}"
  end
end