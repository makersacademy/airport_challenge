require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 5

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail "Airport full" if full?
    fail "Stormy weather" if stormy?
    plane.land(self)
    @planes << plane
  end

  def take_off(plane)
    fail "Stormy weather" if stormy?
    fail "Plane not at this airport" unless @planes.include?(plane)
    plane.take_off
    plane
  end

  private

  def stormy?
    @weather.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
