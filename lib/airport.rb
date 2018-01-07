require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 1

  attr_reader :planes

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    plane if plane.flying?
    fail "Cannot land as airport is full" if full?
    fail "Cannot land due to stormy weather" if @weather.stormy?
    @planes << plane
    @planes.last
  end

  def full?
    @planes.length >= @capacity
  end

  def take_off(plane)
    @planes.delete(plane)
    @planes
  end

end
