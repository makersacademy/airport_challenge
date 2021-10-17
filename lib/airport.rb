class Airport

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def instruct_to_land(plane, weather)
    raise "AirportFull" if full?
    raise "PlaneAlreadyThere" if plane_at_airport?(plane)
    plane.land
    @landed_planes << plane if weather == :sunny
  end

  def instruct_to_take_off(plane, weather)
    raise "PlaneNotAtAirport" unless plane_at_airport?(plane)
    @landed_planes.delete(plane) if weather == :sunny
  end

  def plane_at_airport?(plane)
    @landed_planes.include?(plane)
  end

  private

  def full?
    @landed_planes.count >= @capacity
  end

end
