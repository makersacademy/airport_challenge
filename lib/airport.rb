require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :plane, :capacity

  def initialize
    @plane = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Airport is full' if full?

    @plane << plane
  end

  def take_off
    Plane.new
  end

  private

  def full?
    @plane.count >= capacity
  end
end
