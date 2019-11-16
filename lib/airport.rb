class Airport
  attr_reader :plane

  CAPACITY = 1

  def initialize
    @counter = 0
  end

  def land(plane)
    if @counter >= CAPACITY
      "That airport is full, cannot land"
    else
      @counter += 1
      "Plane has been landed"
    end
  end

  def take_off(plane)
    "Plane has taken off"
  end
end
