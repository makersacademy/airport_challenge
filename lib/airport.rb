require_relative 'plane'
class Airport
  AIRPORT_CAPACITY = 20

  def initialize
    @planes = []
    @capacity = AIRPORT_CAPACITY
  end

  public

  def land(plane)
    fail "Bad weather today. Cannot land." if stormy_weather? > 8
    plane.land_plane
    planes << plane
  end

  def take_off(plane)
    fail "Bad weather today. Cannot take off." if stormy_weather? > 8
    plane.take_off_plane
    planes.delete(plane)
  end

  def stormy_weather?
    rand(10)
  end

  private

  attr_reader :planes

end
