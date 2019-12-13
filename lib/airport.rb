require './lib/plane.rb'

class Airport
  attr_reader :planes_at_airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_at_airport = []
  end

  def land(plane)
    fail "Airport full." if full?
    @planes_at_airport << plane
  end

  def full?
    @planes_at_airport.size >= @capacity
  end

end
