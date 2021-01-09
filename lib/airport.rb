class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    fail "Airport is full" if full?

    @landed_planes << plane
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    "#{plane} has left the Airport"
  end

  private
  def full?
    @landed_planes.count >= @capacity
  end
end
