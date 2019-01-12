class Airport
  attr_reader :planes
  attr_reader :weather

  def initialize
    @planes = []
    @weather = :sunny
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    @planes.slice!(@planes.index(plane))
  end
end

class Plane
end
