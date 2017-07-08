require "plane"

class Airport
  attr_reader :capacity, :plane
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def land(plane)
    @plane = plane
  end

  def takeoff(plane)

  end

end
