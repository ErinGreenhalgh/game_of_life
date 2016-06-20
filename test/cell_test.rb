require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'

class CellTest < Minitest::Test

  def test_it_is_created_with_a_status
    cell = Cell.new(true)
    assert cell.alive?
  end


  def test_we_can_kill_cell
    cell = Cell.new(true)
    assert cell.alive?
    cell.change_status
    refute cell.alive?
  end

  def test_we_can_resurrect_cell
    cell = Cell.new(false)
    refute cell.alive?
    cell.change_status
    assert cell.alive?
  end


end
