require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 5

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail "Stormy weather" if stormy?
    fail "Airport full" if full?
    plane.land(self)
    @planes << plane
  end

  def take_off(plane)
    fail "Stormy weather" if stormy?
    fail "Plane not at this airport" unless  @planes.include(plane)
    plane.take_off
    plane
  end

  private

  def stormy?
    @weather
  end

  def full?
    @planes.count >= @capacity
  end
end
