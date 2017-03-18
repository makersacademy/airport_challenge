class Airport
attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land(plane)
    @planes_in_airport << plane
  end

  def take_off(plane)
    @planes_in_airport.delete(plane)
  end

end
