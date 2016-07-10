require_relative 'plane'
require_relative 'weather'

class Airport
DEFAULT_CAPACITY = 100
attr_reader :planes
attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off(plane)
    @planes.pop
    weather_forecast
    return plane
  end

  def land(plane)
    fail 'Airport full' if full?
    weather_forecast
    @planes << plane
  end

  def full?
    @planes.length >= @capacity ? true : false
  end

  def weather_forecast
    fail 'Weather too stormy right now' if Weather.stormy?
  end

end
