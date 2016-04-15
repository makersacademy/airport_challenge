class Airport

  attr_reader :planes_at_airport

  def initialize
    @planes_at_airport = []
  end

  def take_off(plane)
    planes_at_airport.delete(plane)
  end

  def instruct_land(plane)
    plane.land
    planes_at_airport << plane
  end

end