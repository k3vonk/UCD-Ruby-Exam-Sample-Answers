class Cell
  attr_reader :x, :y
  def initialize (x, y)
    @x = x
    @y = y
  end

  def coverage (cell)
    1/(1 + distance(cell))
  end

  def distance (cell)
    x_dist = ((@x + 0.5) - (cell.x + 0.5)) ** 2
    y_dist = ((@y + 0.5) - (cell.y + 0.5)) ** 2
    Math.sqrt(x_dist + y_dist)
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end