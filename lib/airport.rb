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
    raise("Can't take off during stormy weather") if self.weather == :stormy
    @planes.slice!(@planes.index(plane))
  end
end

class Plane
end
