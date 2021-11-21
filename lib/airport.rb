require_relative "plane"

class Airport

  attr_reader :planes, :capacity, :stormy

  DEFAULT_CAPACITY = 10
  LIKELIHOOD_OF_STORMINESS = 0.2

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    rand(100) >= LIKELIHOOD_OF_STORMINESS * 100 ? @stormy = false : @stormy = true
  end

  def land(plane)
    landing_check(plane)
    plane.flying = false
    @planes << plane
  end

  def takeoff(plane)
    takeoff_check(plane)
    @planes.reject! { |planes| planes == plane }
  end

  def landing_check(plane)
    fail "Airport full" if full?
    fail "Cannot land at stormy airport" if @stormy
    fail "Only planes can land at an airport" if plane.class != Plane
    fail "Only flying plane can land" if plane.flying == false
  end

  def takeoff_check(plane)
    fail "Cannot takeoff from stormy airport" if @stormy
    fail "Specified plane not at this airport" if at_airport?(plane) == false
    fail "Plane cannot take off if it is already flying" if plane.flying == true
  end

  def full?
    @planes.length == capacity
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

end
