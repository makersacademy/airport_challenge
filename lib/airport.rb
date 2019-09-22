require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def land(plane) #creating a new method to land a plane
    @plane = plane
  end

  def take_off
    raise "Weather is stormy" if self.stormy?
    Plane.new #creating a new instance of the plane class to take off
  end

end
