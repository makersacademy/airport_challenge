class Airport

  attr_accessor :landed_planes
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def raise_stormy_errors(sunny_day)
    raise "Cannot land or takeoff while stormy" if sunny_day == false
  end

  def land(plane, sunny_day = true)
    raise_stormy_errors(sunny_day)
    raise "Cannot land, airport at capacity" if full?
    @landed_planes << plane
    self
  end

  def full?
    @capacity <= @landed_planes.count
  end

  def takeoff(sunny_day)
    raise_stormy_errors(sunny_day)
    raise "Cannot takeoff if there are no planes" if @landed_planes.empty?
    @landed_planes.pop
  end

end
