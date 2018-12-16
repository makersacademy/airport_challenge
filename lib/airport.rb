require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane
  def initialize(capacity, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
    # MAXIMUM CAPACITY = 20
  end

  def land(plane)
    raise "Airport Full" if full?
    raise "Cannot land plane: Weather stormy" if stormy?
    @planes.push(plane)
    # @plane = plane
  end

  def take_off(plane)
    raise "Cannot take off: Weather stormy" if stormy?
    # @planes.pop
  end

  private


  def stormy?
    @weather.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
