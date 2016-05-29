require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "Airport full" if full?
    @planes << plane
    fail "Weather not suitable" if stormy?
  end

  def takeoff(plane)
    fail "Weather not suitable" if stormy?
    @planes.pop
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

end

