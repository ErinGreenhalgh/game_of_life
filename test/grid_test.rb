require './lib/grid'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'

class GridTest < Minitest::Test
  def test_we_can_create_a_single_cell
    grid = Grid.new(1)
    assert_kind_of Grid, grid
    assert_equal 1, grid.size
    assert_kind_of Array, grid.rows
    assert_kind_of Cell, grid.rows[0][0]
  end

  def test_we_can_create_a_2_by_2
    grid = Grid.new(2)
    assert_equal 4, grid.size
    assert_equal 2, grid.rows.length
    assert_equal 2, grid.height
    assert_kind_of Cell, grid.rows[1][0]
  end

  def test_it_can_print_grid_representation
    grid = Grid.new(2)
    rows = [
            ["O", "O"],
            ["O", "O"]
           ]
    assert_equal rows, grid.grid_to_symbols
  end

  def test_it_can_generate_pretty_grid

    grid = Grid.new(2)
    rows = "O O\nO O"
    assert_equal rows, grid.pretty_grid
  end

  def test_it_populates_one_cell_with_correct_corrdinates
    grid = Grid.new(1)
    assert_equal [0,0], grid.rows[0][0].coordinates
  end

  def test_populates_2_by_2_grid_with_coordinates_correctly
    grid = Grid.new(2)
    assert_equal [0,0], grid.rows[0][0].coordinates
    assert_equal [0,1], grid.rows[0][1].coordinates
    assert_equal [1,0], grid.rows[1][0].coordinates
    assert_equal [1,1], grid.rows[1][1].coordinates
  end

  def test_it_can_calculate_all_8_theoretical_neighbors
    grid = Grid.new(1)

    result = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]

    neighbors_list = grid.theoretical_neighbors([0, 0])
    assert_equal 8, neighbors_list.count

    assert neighbors_list.all? { |neighbor| result.include?(neighbor) }
  end

  def test_a_single_cell_has_no_neighbors
    skip
    grid = Grid.new(1)
    assert_equal 0, grid.find_neighbors([0,0])
  end

  def test_every_cell_in_2_by_2_grid_has_3_neighbors
    skip
    grid = Grid.new(2)
    assert_equal 3, grid.find_neighbors([0,0])
    assert_equal 3, grid.find_neighbors([0,1])
    assert_equal 3, grid.find_neighbors([1,0])
    assert_equal 3, grid.find_neighbors([1,1])
  end



end
