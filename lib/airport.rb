require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :plane, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
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
