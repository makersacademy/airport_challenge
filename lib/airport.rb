require_relative 'plane'
require_relative 'weather'

Airport = Class.new

class Airport

  attr_reader :planes_airport
  attr_reader :CAPACITY

  def initialize(capacity = 10)
    @planes_airport = []
    @CAPACITY = capacity
  end

  def land(plane, weather)
    if weather.stormy == false && @planes_airport.size < @CAPACITY
      @planes_airport << plane
      return plane
    end
  end

  def take_off(plane, weather)
    if weather.stormy == false
      @planes_airport.delete(plane)
      return plane
    end
  end

end
