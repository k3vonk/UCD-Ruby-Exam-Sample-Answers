require_relative 'base_station.rb'

class BaseStations

  attr_reader :base_stations

  def initialize
    @base_stations = []
  end

  def add_base_station(name, cell)
    @base_stations << BaseStation.new(name, cell)
  end
  def to_s
    @base_stations.inject("") {|s, base_station| s += base_station.to_s}
  end
end