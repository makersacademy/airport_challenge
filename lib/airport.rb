class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity
  attr_accessor :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def landed(plane)
    @planes << plane
  end

  def departed(plane)
    @planes.delete_at(planes.index(plane))
  end

  def full?
    @planes.size >= @capacity
  end
end
