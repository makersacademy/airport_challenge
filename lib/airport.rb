require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 3
  attr_accessor :capacity, :weather

  def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
    @airport = []
    @capacity = capacity
    @weather = weather.forecast
  end

  def land(plane)
    fail 'Airport full' if @airport.length >= DEFAULT_CAPACITY
    fail 'Landing not authorised' if @weather != "sunny"
    @airport << plane
  end

  def take_off
    fail 'Take off not authorised' if @weather != "sunny"
    @airport.pop
    'Plane no longer in the airport'
  end

end
