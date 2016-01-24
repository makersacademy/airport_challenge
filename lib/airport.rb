require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 70

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Bugger off, we're full" if full?
    fail "too stormy" if @weather.stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "too stormy" if @weather.stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def full?
    true if @planes.length >= @capacity
  end

end
