require_relative 'airplane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def capacity
    @capacity
  end

  def planes
    @planes
  end

  def plane_land(plane)
    fail "Cannot land as airport is full" if full?
    fail "Cannot land due to inclement weather" if weather?
    plane.land(plane)
    @planes << plane
  end

  def plane_takeoff(plane)
    fail "Cannot take off due to inclement weather" if weather?
    plane.takeoff(plane)
    @planes.delete(plane)
  end

  private

  def weather?
    weather = Weather.new
    weather.inclement?
  end

  def full?
    @planes.size == capacity
  end

end
