

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @planes << plane
    return plane
  end

end
