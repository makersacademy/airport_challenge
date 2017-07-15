require_relative 'plane'

class Airport

  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Landing not allowed due to stormy weather' if stormy?
    fail 'Landing not allowed, airport full' if full?
    plane.landed = true
    @planes << plane
  end

  def take_off(plane)
    fail 'Take off not allowed due to stormy weather' if stormy?
    plane.landed = false
    @planes.delete(plane)
  end

  def landed
    @plane.landed
  end

  def stormy?
    return [true, false].sample
  end

  def full?
    @planes.count == capacity
  end

end
