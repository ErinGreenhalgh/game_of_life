require './lib/cell'

class Grid
  attr_reader :size, :height

  def initialize(grid_height)
    @height = grid_height
    @size = grid_height ** 2
  end

  def rows
    grid = []
    height.times do
      rows = generate_grid_rows
      grid << rows
    end
    grid
  end

  def generate_grid_rows
    rows = []
    height.times do
      rows << Cell.new(true)
    end
    rows
  end

end
