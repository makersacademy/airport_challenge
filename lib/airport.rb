class Airport
  attr_reader :planes

  def initialize
    @planes = []
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
