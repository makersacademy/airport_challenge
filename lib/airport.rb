require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
  end

  def land(plane, weather)
    fail 'Unable to land. Weather is stormy.' if weather == true
    plane.land
    @planes.push(plane)
  end

  def takeoff(plane, weather)
    fail 'Unable to takeoff. Weather is stormy.' if weather == true
    plane.takeoff
    @planes.pop
  end


end
