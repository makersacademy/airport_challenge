require_relative 'plane'
class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is at maximum capacity" if full?

    fail "This plane is grounded" unless plane.flying

    plane.to_ground
    @planes << plane
  end

  def takeoff(plane)
    fail "This plane is flying" if plane.flying
    
    @planes.delete(plane)
    plane.to_air
    plane
  end

  private
  def full?
    @planes.count >= @capacity
  end
end
