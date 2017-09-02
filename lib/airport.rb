

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "airport full" if full?
    @planes << plane
    return plane
  end

  def full?
    @planes.length >= @capacity
  end

end
