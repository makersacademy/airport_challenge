class Airport

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def instruct_to_land(plane)
    raise "AirportFull" if full?
    @landed_planes << plane if weather == "sunny"
  end

  def instruct_to_take_off(plane)
    raise "PlaneNotAtAirport" unless plane_at_airport?(plane)
    @landed_planes.delete(plane) if weather == "sunny"
  end

  def plane_at_airport?(plane)
    @landed_planes.include?(plane)
  end

  def weather
    rand(101) < 91 ? 'sunny' : 'stormy'
  end

  private

  def full?
    @landed_planes.count >= @capacity
  end

end
