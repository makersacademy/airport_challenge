require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def land(plane)
    raise "This airport is full." if @plane
    @plane = plane
  end

  def take_off(plane)
    plane.flying
    @plane
  end
end
