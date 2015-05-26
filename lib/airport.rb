require_relative 'plane'

DEFAULT_CAPACITY = 6
class Airport
  def initialize
    @planes
  end

  def land(plane)
    fail 'Airport Full' if full?
    plane.land
    planes << plane
    plane
  end

  def launch(plane)
    plane = planes.delete(plane)
    plane.fly
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end
end