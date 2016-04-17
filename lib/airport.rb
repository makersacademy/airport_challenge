require_relative "plane"

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
      plane.land
      @landed_aircraft << plane
  end

  def departure(plane)
    raise "Too stormy to take-off." if stormy?
    plane.take_off
    @landed_aircraft.delete(plane)
  end

#private

  def stormy?
    rand > 0.85
  end

  def full?
    @landed_aircraft.count >= @capacity
  end

end
