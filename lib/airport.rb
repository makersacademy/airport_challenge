require_relative "plane"

class Airport
  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes.push(plane)
  end

  def take_off(plane)
   "Plane #{@landed_planes[-1]} is taking off}"
   @landed_planes.pop
  end
end
