class Airport

  PLANE_CAPACITY = 5
  def initialize(capacity = PLANE_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Error: Max capacity for planes in Airport has been reached." if
    landed_planes.count >= capacity

    landed_planes << plane
  end

  def take_off(plane)
    landed_planes.delete(plane)
  end

  private

  attr_reader :capacity
  attr_reader :landed_planes

end
