class Airport

  def initialize(capacity = 3, storm_chance = 20, airport_name = "Makers Airport")
    @planes_in_airport = []
    @airport_capacity = capacity
    @storm_chance_percentage = storm_chance
    @airport_name = airport_name
  end

  # land planes at airport
  def land_plane(plane)
    raise "Airport is full" if is_airport_full?
    raise "It's too Stormy to land" if !is_it_sunny?
    raise "Plane is aready at Airport" if plane_in_airport?(plane)
    plane.land(@airport_name)
    @planes_in_airport << plane
  end

  # Allow planes to take off
  def takeoff_plane(plane)
    raise "Plane not in the airport" if !plane_in_airport?(plane)
    raise "It's too Stormy to take off" if !is_it_sunny?
    raise "plane not at this airport" if plane.get_airport != @airport_name
    plane.take_off(@airport_name)
    @planes_in_airport.delete(plane)
    plane_in_airport?(plane)
  end

  #check if plane is currently in the airport
  def plane_in_airport?(search_plane)
    return true if @planes_in_airport.include?(search_plane)
    false
  end

  #lets you know if it's sunny out there
  def is_it_sunny?
    rand(100) < @storm_chance_percentage ? false : true
  end

  #is the airport full?
  def is_airport_full?
    @planes_in_airport.length >= @airport_capacity ? true : false
  end

end
