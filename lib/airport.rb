require_relative 'plane'

class Airport

attr_accessor :plane, :capacity

@@DEFAULT_CAPACITY = 10

  def initialize(capacity = @@DEFAULT_CAPACITY)
    @capacity = capacity
    @plane
  end

  def land(plane)
    fail 'Airport is full' if @plane
    @plane = plane
  end

  def take_off(plane)
    @plane = plane
    plane.in_air
  end

end
