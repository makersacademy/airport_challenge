class Airport
  @planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  # land planes at airport
  def land_plane(plane)
    @planes_in_airport << plane
  end

  # Allow planes to take off
  def takeoff_plane(plane)
    @planes_in_airport.delete(plane)
    plane_in_airport?(plane)
  end

  #check if plane is currently in the airport
  def plane_in_airport?(search_plane)
    @planes_in_airport.each {|plane| return true if search_plane == plane}
    false
  end
end

class Plane
end
