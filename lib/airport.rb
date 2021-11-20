require_relative 'plane'
 
class Airport
  CAPACITY = 42
  attr_reader :capacity

  def initialize(capacity = CAPACITY)
    @capacity = capacity
  end

  def land(plane)
    plane.landed
  end

  def take_off(plane)
    plane.taken_off
  end
end
