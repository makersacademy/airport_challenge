require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :landed_aircraft
  attr_reader :capacity
  DEFAULT = 20

  def initialize(capacity=DEFAULT)
    @landed_aircraft = []
    @capacity = capacity
  end

  def arrival(plane)
      fail "Airport is full." if full?
      fail "Too stormy to land." if storms?
      fail "Aircraft already at airport." if plane.in_airport?
      plane.land
      @landed_aircraft << plane
      "Aircraft landed."
  end

  def departure(plane)
    fail "Too stormy to take-off." if storms?
    fail "Aircraft not in airport." unless plane.in_airport?
    plane.take_off
    @landed_aircraft.delete(plane)
    "Aircraft taken off."
  end

  private

  def full?
    @landed_aircraft.count >= @capacity
  end

  def storms?
    Weather.new.stormy?
  end

end
