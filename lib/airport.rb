require_relative 'plane'
 
class Airport
  CAPACITY = 42
  attr_reader :capacity, :hangar

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    plane.landed
    fail 'Airport is full' if full?
  end

  def full?
    @hangar.length >= @capacity
  end

  def take_off(plane)
    #@hangar.pop
    plane.taken_off
  end
end
