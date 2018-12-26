require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []

  end

  def land(plane)
    raise "Airport Full" if full?
    raise "Cannot land plane: Weather stormy" if stormy?
    plane.land(self)
    @planes.push(plane)
    # @plane = plane
  end

  def take_off(plane)
    raise "Cannot take off: Weather stormy" if stormy?
    raise "Cannot take off: Plane not at this airport" unless at_airport?(plane)
    plane.take_off
    @planes.pop
    plane
  end

  private

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def stormy?
    @weather.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
