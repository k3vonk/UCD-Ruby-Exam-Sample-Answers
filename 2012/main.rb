require_relative 'country.rb'
require_relative 'medal_rankings.rb'

olympic = MedalRankings.new

begin
  IO.foreach('medals.txt') do |line|
    data = line.split
    olympic.add_countries(Country.new(data[0],data[1].to_i,data[2].to_i,data[3].to_i, data[4].to_i))
  end
end

puts olympic.to_s
puts olympic.most_gold
puts olympic.total_pop

olympic.sort!.reverse!
puts ""
puts olympic.to_s

medal_winners_population = 0
no_of_countries = 0
olympic.each_medal_winner do |country|
  if country.has_medal?
    medal_winners_population += country.population
    no_of_countries += 1
  end
end

puts "#{medal_winners_population/no_of_countries}"
