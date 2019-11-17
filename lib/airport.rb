class Airport
  attr_accessor :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "That plane is already on land" unless plane.flying?

    fail "That airport is full, cannot land" if @planes.length >= @capacity

    fail "Weather is stormy, cannot land" if weather == "stormy"

    plane.land(self)
    @planes << plane
    "Plane has been landed"
  end

  def take_off(plane)
    fail "That plane is in flight" if plane.flying?

    fail "That plane is in a different airport" unless @planes.include?(plane)

    fail "Weather is stormy, cannot takeoff" if weather == "stormy"

    plane.take_off
    @planes.delete(plane)
    "Plane has taken off"
  end

# Weather has a 20% chance to be stormy
  def weather
    n = rand(5)
    n.zero? ? "stormy" : "sunny"
  end

end
