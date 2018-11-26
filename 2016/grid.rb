require_relative 'cell.rb'

class Grid
  def initialize (size)
    @size = size
    @lower_left_cell = Cell.new(0,0)
    @upper_right_cell = Cell.new(size - 1, size - 1)
  end
end