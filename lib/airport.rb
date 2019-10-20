require_relative 'plane.rb'

class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    raise "Plane already landed." if plane.flying == false

    @landed_planes << plane
    plane.landed
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    "Plane safely taken off."
  end
end
