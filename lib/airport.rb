class Airport
  attr_accessor :stationed_planes
  def initialize
    @stationed_planes = []
  end

  def arrival(plane)
    stationed_planes << plane
  end

  def departure(plane)
    stationed_planes.delete(plane)
  end
end
