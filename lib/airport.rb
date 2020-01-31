require_relative 'plane'
require_relative 'weather'

class Airport
attr_reader :airport
attr_accessor :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end
    
  def land(plane)
    fail "Error airport full." if full?
    @airport << plane
  end

  def take_off(plane, weather)
    fail "Error weather too stormy" if weather.todays_weather 

    @airport.delete(plane)
  end

  private

  def full?
    @airport.length >= @capacity
  end
end
