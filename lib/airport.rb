require 'plane'
require 'weather'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane = Plane.new)
    @landed_planes << plane
    'Plane has landed'
  end

  def plane_takeoff
    @landed_planes.pop
    'Plane has taken off'
  end
end
