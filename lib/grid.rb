require './lib/cell'

class Grid
  attr_reader :size, :height

  def initialize(grid_height)
    @height = grid_height
    @size = grid_height ** 2
  end

  def rows
    grid = []
    (0...height).each do |i|
      rows = generate_single_row(i)
      grid << rows
    end
    grid
  end

  def generate_single_row(current_row)
    row = []
    (0...height).each do |i|
      row << Cell.new([current_row, current_column], true)
    end
    row
  end

  def display
    rows.map { |row| row.map { |cell| cell_symbol(cell) } }
  end

  def cell_symbol(cell)
    if cell.alive?
      0
    else
      "."
    end
  end

  def pretty_print
    result = ""
    display.map do |row|
      result << row.join(" ") + "\n"
    end
    result.chomp
  end

  #get/give the coordinates of the cell we are interested in
  #find out all the cell's neighbors
  #count # of alive neighbors
  #based on the rules, change the cell's status
  #do this for every cell in the grid
  #render the new grid

end
