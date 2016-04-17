require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :landed_aircraft
  attr_accessor :capacity
  DEFAULT = 20

  def initialize(capacity=DEFAULT)
    @landed_aircraft = []
    @capacity = capacity
  end

  def arrival(plane)
      raise "Too stormy to land." if stormy?
      raise "Airport is full." if full?
      raise "Aircraft already at airport." if plane.in_airport?
      plane.land
      @landed_aircraft << plane
  end

  def departure(plane)
    raise "Too stormy to take-off." if stormy?
    raise "Aircraft not in airport." unless plane.in_airport?
    plane.take_off
    @landed_aircraft.delete(plane)
  end

  def full?
    @landed_aircraft.count >= @capacity
  end

end
