require_relative 'plane'

class Airport

attr_accessor :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if @planes.length >= capacity
    @planes << plane
  end

  def take_off(plane)
    plane
  end

end
