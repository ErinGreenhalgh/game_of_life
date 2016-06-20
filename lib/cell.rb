class Cell

  def initialize(status)
    @alive = status
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
