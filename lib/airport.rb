require './lib/plane'
require './lib/weather'

class Airport
  
  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    weather = Weather.new.weather_conditions
    raise "Airport is full" if full?
    raise "Weather is stormy. Landing not permitted." if weather == "stormy"
    @planes << plane unless plane.grounded
  end

  def takeoff(plane)
    weather = Weather.new.weather_conditions
    raise "Weather is stormy. Takeoff not permitted." if weather == "stormy"
    planes.delete(plane)
  end

  private

  def full?
    return true if planes.length >= capacity
    false
  end
end
