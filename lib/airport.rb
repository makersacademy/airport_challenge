require "plane"

class Airport
  attr_reader :capacity
  attr_accessor :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def takeoff(plane)
    planes.delete(plane)
  end

end
