class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :name, :capacity, :runway

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    fail 'This is not a valid aircraft' unless plane.is_a?(Plane)
    fail 'Aircraft is already on the ground' if plane.grounded
    fail 'Weather is stormy - arrival delayed' if stormy?
    fail 'Flight -  we are at capacity. Maintain holding' if full?
    runway << plane
    plane.report_grounded
    "Tower - this is #{plane.name}. We have touchdown"
  end

  def take_off(plane)
    fail "Aircraft is not present at this location" unless runway.include?(plane)
    fail 'Weather is stormy - departure delayed' if stormy?
    runway.delete(plane)
    plane.report_airborne
    "Tower - #{plane.name} is now airborne"
  end

  def stormy?
    rand(10) >= 1
  end

  def full?
    runway.count >= capacity
  end

end
