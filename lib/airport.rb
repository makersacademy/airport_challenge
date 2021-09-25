class Airport
  def initialize(default_capacity)
    @capacity = default_capacity
    @planes_parked = ["Plane 1"]
  end

  def specific_plane_in_airport?
    return true
  end

  def airport_full?
    return true
  end

  def check_capacity
    return @capacity
  end

  def which_planes_in_airport
    # return the contents of an array?
    return @planes_parked
  end

  def how_many_planes_in_airport
    @number_of_planes = @planes_parked.length
    return @number_of_planes
  end

  def park_plane(plane)
    @planes_parked.push(plane)
    return true
  end

end
