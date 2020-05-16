require_relative 'plane'

class Airport

  attr_reader :capacity, :planes

  def initialize(cap = DEFAULT_CAPACITY)
    @planes = []
    @capacity = cap
  end

  DEFAULT_CAPACITY = 100

  def at_capacity?
    @planes.length == DEFAULT_CAPACITY
  end

  def plane_land(plane)
    @planes << plane
  end

  def plane_take_off
    @planes.pop
  end
end
