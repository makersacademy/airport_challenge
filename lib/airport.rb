class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :spaces, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @spaces = []
  end

  def land(plane)
    raise "Airport full, landing denied." if full?

    spaces << plane
  end

  def takeoff(plane)
    spaces.delete(plane)
  end

private
  def full?
    spaces.count == capacity
  end
end
