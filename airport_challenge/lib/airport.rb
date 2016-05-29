require_relative 'plane'

attr_reader :plane

class Airport
  def plane_takeoff
    Plane.new
  end
  def plane
  end

  def land(plane)
    @plane = plane
  end
end
