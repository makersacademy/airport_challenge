require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Plane already landed" unless plane.flying?
    fail "Airport Full" if full?
    fail "Weather Warning, can't land plane" if weather.stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane already taken off" if plane.flying?
    fail "Plane isn't in the airport" unless planes.include?(plane)
    fail "Weather Warning, can't take off" if weather.stormy?
    plane.take_off
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
