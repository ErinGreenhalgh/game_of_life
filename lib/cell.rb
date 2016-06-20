class Cell
  attr_reader :coordinates

  def initialize(coordinates, status = true)
    @alive = status
    @coordinates = coordinates
  end

  def alive?
    @alive
  end

  def change_status
    if alive?
      @alive = false
    else
      @alive = true
    end
  end

end
