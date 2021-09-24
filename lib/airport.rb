class Airport
  attr_reader :planes
  attr_reader :capacity
  def initialize
    @planes = []
    @capacity = 1
  end
  def land(plane)
    @planes << plane
  end
  def takeoff
    @planes.shift
  end
  def full?
    @planes.length == @capacity ? true : false
  end
end
