require_relative 'tournament.rb'
require_relative 'player.rb'

tournament = Tournament.new

begin
  IO.foreach('tournament.txt') do |line|
    data = line.split
    name = data[0]
    rating = data[1].to_i
    results = [data[2].to_i, data[3].to_i, data[4].to_i, data[5].to_i, data[6].to_i]
    tournament.add_player(Player.new(name, rating, results))
  end
end

puts "Average rating is: #{tournament.average_rating}"
tournament.sort!
puts tournament.to_s

if tournament.consistent?
  puts "No problems"
else
  puts "Problem occured"
end

puts tournament.new_to_s

