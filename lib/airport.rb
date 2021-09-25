class Airport
  attr_reader :capacity

  def initialize(capacity = 50)
    @capacity = capacity
  end

  def land(plane)
    fail "airport is full" if @plane
    @plane = plane
  end

  def takeoff(plane)
  end
end
