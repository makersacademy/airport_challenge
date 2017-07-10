require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity: 1, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "Cannot land since airport is full" if full?
    fail "Unable to land due to weather" if weather.stormy?
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
