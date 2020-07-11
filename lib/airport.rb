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
    raise "airport is full" if full?
    @planes << plane
  end

  def takeoff(plane)
    @sky << plane
    @planes.pop
    "plane has taken off"
  end

  def full?
    @planes.count == @capacity
  end
end
