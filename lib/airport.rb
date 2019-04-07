require 'weather'
require 'plane'

class Airport
  attr_reader :spaces, :capacity
  CAPACITY = 1

  def initialize
    @spaces = []
    @capacity = CAPACITY
  end

  def land(plane)
    raise 'It is too stormy to land' if stormy?
    raise 'Airport is full' if full?

    spaces << plane
  end

  def takeoff(plane)
    raise 'Weather is too stormy to takeoff' if stormy?

    plane_taken_off
    plane
  end

  def full?
    spaces.count >= capacity
  end

  private

  def stormy?
    @stormy
  end

  def plane_taken_off
    'Plane has taken off'
  end
end
