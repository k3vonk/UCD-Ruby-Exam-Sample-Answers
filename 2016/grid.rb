require_relative 'cell.rb'

class Grid
  attr_reader :size

  def initialize (size)
    @size = size
    @lower_left_cell = Cell.new(0,0)
    @upper_right_cell = Cell.new(size - 1, size - 1)
  end

  def cell_of_base_stations (base_stations)
    @base_stations_cells = []
    base_stations.each {|base_station| @base_stations_cells << base_station.cell}
  end

  def coverage_everything
    @weak_coverage_cells = []
    @medium_coverage_cells = []
    @strong_coverage_cells = []

    (@size - 1).times do |i|
      (@size - 1).times do |j|
        hold = Cell.new(i, j).distance(@base_stations_cells[0])
        best_cov = 0
        @base_stations_cells.length.times do |station|
          temp = Cell.new(i, j).distance(@base_stations_cells[station])
         if temp < hold
           best_cov = Cell.new(i, j).coverage(@base_stations_cells[station])
         end
        end

        if best_cov <= 0.1
          @weak_coverage_cells << Cell.new(i,j)
        elsif best_cov <= 0.3 && best_cov > 0.1
          @medium_coverage_cells << Cell.new(i,j)
        else
          @strong_coverage_cells << Cell.new(i,j)
        end
      end
    end
  end

  def converge_to_s
    s = "number of cells with weak coverage: #{@weak_coverage_cells.length}"
    s += "\nnumber of cells with medium coverage: #{@medium_coverage_cells.length}"
    s += "\nnumber of cells with strong coverage: #{@strong_coverage_cells.length}"
    s += "\nWEAK CELLS: "
    @weak_coverage_cells.inject(s) {|str, cell| str += cell.to_s}
  end




end