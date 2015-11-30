require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def tell_plane_to_land(plane)
    fail "Airport full" if full?
    fail "Plane can't land in a storm" if stormy?
    plane.land
    planes << plane
  end

  def tell_plane_to_take_off(plane)
    fail "Plane can't take off in a storm" if (plane.landed? == true) && stormy?
    plane.take_off
    planes.delete(plane)
  end


  private

  def full?
    @planes.count >= capacity
  end

  def stormy?
    weather.stormy?
  end
end
