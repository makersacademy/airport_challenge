require_relative 'plane'

class Airport

  def clear_for_takeoff
    Plane.new
  end

  def allow_landing(plane)
    @plane = plane
  end
end
