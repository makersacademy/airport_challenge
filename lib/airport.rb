require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :plane

  def initialize
    @plane = []
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
    @plane.count >= DEFAULT_CAPACITY
  end
end
