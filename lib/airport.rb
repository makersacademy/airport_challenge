class Airport
  attr_reader :bunker
  def initialize
    @bunker = []
  end
  def land(plane)
    @bunker << Plane.new
  end
  def takeoff(plane)
  end
  def capacity
  end
end
