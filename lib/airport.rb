require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :landed_planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    fail "Can't land, the airport is full" if at_capacity?
    fail "Can't land in storm" if Weather.stormy?
    plane.land(self)
    @landed_planes << plane
  end

  def take_off(plane)
    fail "Can't take off in storm" if Weather.stormy?
    plane.take_off(self)
    remove_planes_from_landed_planes(plane)
  end

  def update_capacity(capacity)
    @capacity = capacity
  end

  private

  def at_capacity?
    landed_planes.count >= capacity
  end

  def remove_planes_from_landed_planes(plane)
    @landed_planes.delete(plane)
  end
end
