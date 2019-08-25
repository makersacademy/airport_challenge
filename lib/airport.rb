class Airport

  def initialize(storm_chance = 20, capacity = 3)
    @planes_in_airport = []
    @airport_capacity = capacity
    @storm_chance_percentage = storm_chance
  end

  # land planes at airport
  def land_plane(plane)
    raise "Airport is full" if is_airport_full?

    if is_it_sunny?
      @planes_in_airport << plane
    else
      raise "It's too Stormy to land"
    end

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

class Plane
end
