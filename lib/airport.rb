require_relative 'plane'

class Airport
  attr_reader :planes_at_airport

  def initialize
    @planes_at_airport = []
    @capacity = 20
  end
  
  def land(plane)
    check_for_capacity
    @planes_at_airport << plane
  end

  def takeoff(plane)
    planes_at_airport.delete(plane)
    return "#{plane} has taken off"
  end

  def check_for_capacity
    fail "Airport is at capacity" if @planes_at_airport.length == @capacity
  end

end
