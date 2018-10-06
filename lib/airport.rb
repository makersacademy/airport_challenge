

class Airport
  attr_reader :flights
  def initialize
    @flights = []
  end

  def land(plane)
    @flights << plane
  end

  def takeoff(plane)
    @flights.delete(plane)
  end
end
