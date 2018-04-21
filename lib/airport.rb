require_relative './exceptions'
require_relative './weather'

class Airport

  include Weather

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise AirportError, "Weather is stormy, cannot land." if stormy?
    raise PlaneError, "Plane already on the ground" unless plane.flying?
    plane.land(self)
    planes << plane
  end

  def release(plane)
    raise AirportError, "Weather is stormy, cannot take off." if stormy?
    raise PlaneError, "Plane already in-flight" if plane.flying?
    raise AirportError, "Plane not in current airport" unless registered?(plane)
    plane.take_off
    planes.delete(plane)
  end

  def registered?(plane)
    planes.include?(plane)
  end


end
