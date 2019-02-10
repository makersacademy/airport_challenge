require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes_at_airport
  attr_reader :in_the_air
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_at_airport = []
    @in_the_air = []
  end

  def land(plane)
    fail 'Airport is full' if full?

    @planes_at_airport << plane
  end

  def take_off(plane)
    @in_the_air << plane
  end

  def full?
    @planes_at_airport.count >= capacity
  end

end
