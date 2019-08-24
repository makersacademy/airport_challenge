class Airport

  def initialize(storm_chance = 20)
    @planes_in_airport = []
    @storm_chance_percentage = storm_chance
  end

  # land planes at airport
  def land_plane(plane)
    @planes_in_airport << plane
  end

  # Allow planes to take off
  def takeoff_plane(plane)
    if is_it_sunny?
      @planes_in_airport.delete(plane)
      plane_in_airport?(plane)
    else
      raise "It's too Stormy to take off"
    end
  end

  #check if plane is currently in the airport
  def plane_in_airport?(search_plane)
    @planes_in_airport.each {|plane| return true if search_plane == plane}
    false
  end

  #lets you know if it's sunny out there
  def is_it_sunny?
    rand(100) < @storm_chance_percentage ? false : true
  end
end

class Plane
end
