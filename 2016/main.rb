require_relative 'cell.rb'
require_relative 'grid.rb'
require_relative 'base_station.rb'
require_relative 'base_stations.rb'

data = File.new('base_stations.txt').map {|line| line}

grid = Grid.new(data[0].to_i)
base_stations = BaseStations.new

(data.length - 1).times do |base|
  str = data[base + 1].split
  base_stations.add_base_station(str[0], Cell.new(str[1].to_i, str[2].to_i))
end

puts base_stations.to_s

#################################
grid.cell_of_base_stations(base_stations.base_stations)
grid.coverage_everything
puts grid.converge_to_s
