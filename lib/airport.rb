require 'plane.rb'

class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes.push(plane)
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    "Plane has taken off"
  end
end
