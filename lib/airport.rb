require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
  end

  def land(plane)
    fail 'The airport is full, you cannot land' if @plane.count >= DEFAULT_CAPACITY
    @plane << plane
  end

  def takeoff
    @plane.pop
    "The plane instructed has now left the airport"
  end
end
