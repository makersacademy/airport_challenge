require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes
  attr_reader :capacity

  def initialize(weather: Weather.new)
    @capacity = DEFAULT_CAPACITY
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "Cannot land since airport is full" if full?
    #fail "Unable to land due to weather" if weather.stormy?
    @planes << plane
  end

  def take_off
    fail "Unable to take off due to weather" if weather.stormy?
    planes.pop
  end

  private
  attr_reader :weather

  def full?
    planes.count >= capacity
  end
end
