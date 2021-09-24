class Airport
  attr_reader :planes
  attr_reader :capacity
  def initialize(capacity)
    @planes = []
    @capacity = capacity
  end
  def land(plane)
    if !self.full?
      @planes << plane
    else
      raise("CANNOT LAND. THIS AIRPORT IS FULL.")
    end
  end
  def takeoff
    @planes.shift
  end
  def full?
    @planes.length == @capacity ? true : false
  end
end
