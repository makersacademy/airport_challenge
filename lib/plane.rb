require_relative "airport"

class Plane

  def initialize(plane = [])
    @plane = plane
  end

  def land(plane)
    @plane << plane
  end

  def takeoff
    @plane.pop
  end

end
