require_relative 'plane'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane already landed" unless plane.flying?
    fail "Airport Full" if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
