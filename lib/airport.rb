require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport is full!' if @planes.count >= DEFAULT_CAPACITY
    fail 'Plane has already arrived.' if include?(plane)
    plane.arrived
    @planes << plane
    plane
  end

  def takeoff(plane)
    fail 'Plane is not at this airport.' unless include?(plane)
    plane.departed
    @planes.delete(plane)
    plane
  end

  private
  def include?(plane)
    @planes.include?(plane)
  end
end