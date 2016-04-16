require_relative "plane"

class Airport
  attr_reader :landed_aircraft
  def initialize
    @landed_aircraft = []
  end

  def arrival(plane)
    plane.land
    @landed_aircraft << plane
  end

  def departure(plane)
    plane.take_off
    @landed_aircraft.delete(plane)
  end

  def stormy?
  end

end
