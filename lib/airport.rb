require_relative 'plane'

class Airport
  attr_accessor :plane

  def land(plane)
    fail 'Airport is full!' if @plane
    plane.arrived
    @plane = plane
  end

  def takeoff(plane)
    fail 'Plane is not at this airport.' unless @plane
    plane.departed
    @plane = nil
    plane
  end
end