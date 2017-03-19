require_relative 'plane'
require_relative 'weather'
class Airport

  AIRPORT_CAPACITY = 20

  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = AIRPORT_CAPACITY
  end

  public

  def land(plane, weather)
    fail "Bad weather today. Cannot land." if weather.stormy_weather?
    fail "Sorry. Airport full. Go away." if full?
    plane.land_plane
    planes << plane
  end

  def take_off(plane, weather)
    fail "Bad weather today. Cannot take off." if weather.stormy_weather?
    plane.take_off_plane
    planes.delete(plane)
  end

  private

  def full?
    planes.count >= capacity
  end

  attr_reader :planes

end
