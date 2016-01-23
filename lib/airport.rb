require_relative 'plane'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 50

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    plane.to_land
  end
end
