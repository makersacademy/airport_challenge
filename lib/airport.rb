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
    if @airport.length >= DEFAULT_CAPACITY
      fail 'Airport full'
    end
    if @weather != "sunny"  
      fail 'Landing not authorised'
    end
    @airport << plane
  end

  def take_off
    if @weather != "sunny"
      fail 'Take off not authorised'
    end
    @airport.pop
     'Plane no longer in the airport'
  end
end
