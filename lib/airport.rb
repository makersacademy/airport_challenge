require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "No landing, stormy weather" if weather.weather_now == :stormy
    raise "No landing, airport full" if planes.count == capacity
    @planes << plane
  end

  def take_off(plane)
    raise "Plane not in airport" unless @planes.include? plane
#    raise "No take-off, stormy weather" if weather.weather_now == :stormy
    @planes.delete(plane)
  end

end
