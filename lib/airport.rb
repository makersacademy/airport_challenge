class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

end
