class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @counter = 0
  end

  def land(plane)
    fail "That airport is full, cannot land" if @counter >= @capacity

    fail "Weather is stormy, cannot land" if weather == "stormy"

    @counter += 1
    "Plane has been landed"
  end

  def take_off(plane)
    fail "Weather is stormy, cannot takeoff" if weather == "stormy"

    "Plane has taken off"
  end

# Weather has a 20% chance to be stormy
  def weather
    n = rand(5)
    n.zero? ? "stormy" : "sunny"
  end

end
