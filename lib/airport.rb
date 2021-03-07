class Airport
  attr_reader :planes, :capacity

  def initialize(planes, capacity = 5)
    @planes = planes
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full; cannot land plane." if @planes.length >= @capacity
    @planes << plane
    return "Plane landed"
  end

  def takeoff(_plane)
    return "Plane taken off"
  end
  
  def at_airport?(_plane)
    return false
  end
end
