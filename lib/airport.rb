require 'weather'
require 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Plane is not in the air" if plane.in_flight?
    fail 'Due to stormy weather no landing allowed' if stormy?
    fail 'Airport is full no landing allowed' if @planes.count >= DEFAULT_CAPACITY 
    plane.in_flight = false
    @planes << plane
  end
  
  def takeoff(plane)
    fail 'Due to stormy weather no landing allowed' if stormy?
    fail 'Plane is not at the airport' if plane.in_flight?
    @planes.delete(plane)
    'plane has taken off'
  end

  def stormy?
    @weather.stormy
  end
end
