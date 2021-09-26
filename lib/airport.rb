class Airport
  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 1
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    raise("CANNOT LAND. THIS PLANE IS ON THE GROUND.") unless plane.position == "air"
    raise("CANNOT LAND. THE WEATHER IS STORMY.") unless weather == "sunny"
    raise("CANNOT LAND. THIS AIRPORT IS FULL.") if full?
    @planes << plane
    plane.change_position
  end

  def takeoff(plane, weather)
    raise("CANNOT TAKEOFF. THIS PLANE IS NOT AT THIS AIRPORT") if planes.find_index(plane).nil?
    raise("CANNOT TAKEOFF. THE WEATHER IS STORMY.") unless weather == "sunny"
    raise("CANNOT TAKEOFF. THIS PLANE IS IN THE AIR.") unless plane.position == "ground"
    @planes.delete(plane)
    plane.change_position
  end

  def full?
    @planes.length == @capacity
  end
end
