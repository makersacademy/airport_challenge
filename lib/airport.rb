require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @plane = plane
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    Plane.new
  end

private
def full?
  @planes.length >= DEFAULT_CAPACITY
end

end
