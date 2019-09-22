require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def land(plane) #creating a new method to land a plane
    raise "Weather is stormy" if @stormy
    @plane = plane
  end

  def take_off
    raise "Weather is stormy" if @stormy
    Plane.new #creating a new instance of the plane class to take off
  end

end
