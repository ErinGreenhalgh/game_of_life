require './lib/cell'

class Grid
  attr_reader :size, :height

  def initialize(grid_height)
    @height = grid_height
    @size = grid_height ** 2
  end

  def rows
    grid = []
    (0...height).each do |current_row|
      rows = generate_single_row(current_row)
      grid << rows
    end
    grid
  end

  def generate_single_row(current_row)
    row = []
    (0...height).each do |current_column|
      row << Cell.new([current_row, current_column], true)
    end
    row
  end

  def grid_to_symbols
    rows.map { |row| row.map { |cell| cell_to_symbol(cell) } }
  end

  def cell_to_symbol(cell)
    if cell.alive?
      "O"
    else
      "."
    end
  end

  def pretty_grid
    result = ""
    grid_to_symbols.map do |row|
      result << row.join(" ") + "\n"
    end
    result.chomp
  end

  def find_neighbors(coordinates)

  end

  def theoretical_neighbors(coordinates)
    find_adjacent_neighbors(coordinates) + find_diagonal_neighbors(coordinates)
  end

  def find_adjacent_neighbors(coordinates)
    a = [(coordinates[0] - 1), coordinates[1]]
    b = [(coordinates[0] + 1), coordinates[1]]
    c = [coordinates[0], (coordinates[1] - 1)]
    d = [coordinates[0], (coordinates[1] +1)]
    [a, b, c, d]
  end

  def find_diagonal_neighbors(coordinates)
    a = [(coordinates[0] - 1), (coordinates[1] - 1) ]
    b = [(coordinates[0] + 1), (coordinates[1] + 1)]
    c = [(coordinates[0] - 1), (coordinates[1] + 1)]
    d = [(coordinates[0] + 1), (coordinates[1]  - 1)]
    [a, b, c, d]
  end



  #get/give the coordinates of the cell we are interested in
  #find out all the cell's neighbors
  #count # of alive neighbors
  #based on the rules, change the cell's status
  #do this for every cell in the grid
  #render the new grid

end
