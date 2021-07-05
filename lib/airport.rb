require "./lib/plane.rb"
require "./lib/weather.rb"
class TrafficControl
  attr_reader :runway, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @runway = []
    @weather = weather
  end
  
  def land(plane)
    raise "Runway full" if full?
    
    @runway << plane
  end
  
  def takeoff(plane)
    @runway.delete(plane)
  end
  
  def full?
    @runway.count >= @capacity
  end
end
