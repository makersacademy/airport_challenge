class Airport
  @planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land_plane(plane)
    @planes_in_airport << plane
  end

  def takeoff_plane(plane)
    @planes_in_airport.delete(plane)
    plane_in_airport?(plane)
  end

  def plane_in_airport?(search_plane)
    @planes_in_airport.each do |plane|
      return true if search_plane == plane
    end
    false
  end
end

class Plane
end
