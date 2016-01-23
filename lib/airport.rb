require_relative 'plane'

class Airport
  attr_accessor :planes
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport is full!' if @planes.count >= 20
    plane.arrived
    @planes << plane
    plane
  end

  def takeoff(plane)
    fail 'Plane is not at this airport.' unless @planes.include?(plane)
    plane.departed
    @planes.delete(plane)
    plane
  end
end