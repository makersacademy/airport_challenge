require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Plane is already landed" if plane.landed
    fail "Bad weather - unable to land" if stormy?
    @planes << plane
    plane.land
  end

  def take_off(plane)
    fail "Plane not in airport" unless @planes.include?(plane)
    fail "Bad weather - unable to take off" if stormy?
    @planes.delete(plane)
    plane.take_off
  end

private

  def full?
    @planes.length >= capacity
  end

  def stormy?
    @weather.stormy?
  end

end
