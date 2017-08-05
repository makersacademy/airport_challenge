class Airport
  attr_accessor :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end
end

class Plane
end
