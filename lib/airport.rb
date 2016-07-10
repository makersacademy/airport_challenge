require_relative 'weather'
require_relative 'plane'

class Airport

attr_reader :planes
attr_reader :weather
DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Storm" if weather.stormy?
    fail "Full" if full?
    @planes << plane
    plane.location = :airport
    @planes
  end

  def take_off(plane)
    fail "Error: that plane isn't at this airport" unless @planes.include? plane
    fail "Storm" if weather.stormy?
    plane.location = :air
    @planes.delete(plane)
  end

  def full?
    planes.count >= @capacity
  end
end
