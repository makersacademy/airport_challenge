class Airport
  @planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land_plane(plane)
    plane
  end

  def takeoff_plane(plane)
    true
  end

  def plane_in_airport?(plane)
    true
  end
end

class Plane
end
