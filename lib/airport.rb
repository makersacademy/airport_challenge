require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5

  attr :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is at full capacity' if @planes.length >= DEFAULT_CAPACITY

    fail "Plane is already at airport" if @planes.include?(plane)

    fail 'Weather is too bad' if weather.stormy?

    @planes << plane
    plane.plane_arrives
  end

  def take_off(plane)
    fail 'Weather is too bad' if weather.stormy?

    fail "this plane isn't at the airport" unless @planes.include?(plane)

    planes.delete(plane)
    plane.plane_leaves
  end
end
