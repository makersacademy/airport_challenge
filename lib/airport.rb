require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Cannot land plane, plane is on the ground" if plane.landed
    fail "Cannot land plane, airport is full" if full?
    fail "Cannot land plane, weather is stormy" if @weather.stormy?
    plane.landed = true
    @planes << plane
  end

  def takeoff(plane)
    fail "Plane cannot takeoff, plane is in the air" unless plane.landed
    fail "Plane cannot takeoff, weather is stormy" if @weather.stormy?
    @planes.pop
    plane.landed = false
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
