require_relative 'card.rb'
require_relative 'pack.rb'
require_relative 'hand.rb'

card = Card.new(SUIT[rand(SUIT.length)], KIND[rand(KIND.length)])

counter = 1
while !card.is_equal?(:HEARTS, :JACK)
  card.generate_random
  counter += 1
end

puts "Found #{card.to_s} after #{counter} attempts"

pack = Pack.new
counter = 1
one = pack.pick_random
two = pack.pick_random
three = pack.pick_random

while !(one == two && two == three)
  pack.add_card(one)
  pack.add_card(two)
  pack.add_card(three)
  one = pack.pick_random
  two = pack.pick_random
  three = pack.pick_random
  counter += 1
end

puts "Found three #{one.kind.to_s} after #{counter} attempts"
puts "#{one}"
puts "#{two}"
puts "#{three}"

deck = Pack.new
players = [Hand.new, Hand.new, Hand.new, Hand.new]

players.each do |player|
  deck.deal_hand(player)
  puts player.to_s
end

players.sort!.reverse!
puts ""
players.each do |player|
  puts player.to_s
end



