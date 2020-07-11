class Airport
  attr_reader :capacity, :sky
  attr_accessor :planes

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
    @planes.pop
    "plane has taken off"
  end
end
