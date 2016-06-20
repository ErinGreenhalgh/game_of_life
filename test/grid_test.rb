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
end
