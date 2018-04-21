class Airport

DEFAULT_CAPACITY = 50
attr_reader :planes, :capacity

  def initialize( capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'airport is full' if @planes.size == DEFAULT_CAPACITY
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end

end
