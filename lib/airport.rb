require_relative 'plane'

class Airport

  def clear_for_takeoff
    Plane.new
  end

  def clear_for_landing(plane)
    @plane = plane
  end
end
