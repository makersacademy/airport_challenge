class Airport

  DEFAULT_CAPACITY = 25
  attr_reader :capacity, :grounded_planes

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @grounded_planes = []
  end

  def land(plane)
      fail "Airport is full. Unable to land." if full?
      @grounded_planes << plane
  end

  def full?
    @grounded_planes.count == @capacity
  end

  def takeoff(plane)
    plane
  end

end
