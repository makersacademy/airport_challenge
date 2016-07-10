require_relative "plane.rb"

DEFAULT_CAPACITY = 30

class Airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_reader :capacity

  def land(plane)
    plane.flying = false
    @planes << plane
  end

  def take_off
    @planes[-1].flying = true
    @planes.pop

  end

end
