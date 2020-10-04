class Airport
  PLANE_UNITS = 10
  def initalize(capacity: PLANE_UNITS)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    return nil unless capacity == full
  end

  def take_off(plane)
    plane
  end

  def full
    @plane.length >= @capacity
  end
end
