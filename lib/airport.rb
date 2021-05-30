require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 6

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'airport is full' if @planes.length >= @capacity
    @planes.push(plane.landed)
  end

  def take_off(plane)
    plane.taking_off
    @planes.delete(plane)
  end
end
