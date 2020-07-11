class Airport
  attr_reader :planes, :capacity, :sky

  DEFAULT_CAPACITY = 1

  def initialize(capacity = 1)
    @capacity = capacity
    @planes = []
    @sky = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
      @sky << plane
  end
end
