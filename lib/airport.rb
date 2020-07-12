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
    raise "too stormy to land" if stormy?

    raise "airport is full" if full?

    @planes << plane
    "plane landed"
  end

  def takeoff(plane)
    raise "too stormy to take off" if stormy?

    @planes.pop
    @sky << plane
    "plane has taken off"
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..5) == 1
  end
end
