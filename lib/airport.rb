require 'weather'

DEFAULT_CAPACITY = 20

# The Airport class allows planes to be landed at the the airport and planes
# which are currently landed at the airport to take off. It has two optional
# parameters: weather, which allows the controller to set a weather generator,
# and capacity, which allows the controller to set the maximum number of planes
# which can land.
class Airport

  attr_reader :landed_planes, :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    raise "Unable to land plane due to stormy weather" if stormy?
    raise "Airport at capacity" if full?
    raise "Plane already landed" if plane.landed
    landed_planes << plane
    plane.land
  end

  def take_off(plane)
    raise "Unable to take off plane due to stormy weather" if stormy?
    raise "Plane not landed at airport" unless plane_at_airport?(plane)
    landed_planes.delete(plane)
    plane.take_off
  end

  private

  def full?
    @landed_planes.size >= @capacity
  end

  def plane_at_airport?(plane)
    landed_planes.include?(plane)
  end

  def stormy?
    @weather.stormy?
  end

end
