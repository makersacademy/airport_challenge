require_relative 'plane'
class Airport
  def land(plane)
    @planes = plane
  end
  def takeoff
    Plane.new
  end
end
