class Airport

  attr_accessor :landed_planes
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end


  def land(plane)
    raise "Cannot land, airport at capacity" if full?
    @landed_planes << plane
    self
  end

  def full?
    @capacity <= @landed_planes.count
  end

end
