require 'plane'
require 'weather'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
    @weather = Weather.new
  end

  def land(plane = Plane.new)
    fail "Cannot land when it's stormy" if bad_conditions?
    @landed_planes << plane
    'Plane has landed'
  end

  def plane_takeoff
    fail "Cannot take off when it's stormy" if bad_conditions?
    @landed_planes.pop
    'Plane has taken off'
  end

  def bad_conditions?
    @weather.stormy?
  end
  
end
