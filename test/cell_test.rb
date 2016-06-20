require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'

class CellTest < Minitest::Test

  def test_it_is_created_with_a_status
    cell = Cell.new([0,0])
    assert cell.alive?
  end


  def test_we_can_kill_cell
    cell = Cell.new([0,0])
    assert cell.alive?
    cell.change_status
    refute cell.alive?
  end

  def test_we_can_resurrect_cell
    cell = Cell.new([0,0], false)
    refute cell.alive?
    cell.change_status
    assert cell.alive?
  end

  def test_it_can_give_its_coordinates
    cell = Cell.new([0,0])
    assert_equal [0,0], cell.coordinates
  end


end
