require_relative 'oracle.rb'
require_relative 'player.rb'
require_relative 'random_player.rb'
require_relative 'smart_player.rb'
require_relative 'sequential_player.rb'


range = [1,100]
oracle = Oracle.new(range[1])

players = []
players << RandomPlayer.new('John', oracle, range)
players << SmartPlayer.new('Aoife', oracle, range.clone)
players << SequentialPlayer.new('Tom', oracle, range.clone)

players.each do |player|
  counter = 0
  while player.guess != 0
    counter += 1
  end

  player.count(counter)
end

players.sort_by! {|player| player.counter}.reverse!
players.each {|player| puts player.to_s}