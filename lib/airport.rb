class Airport
  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 1
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  def land(plane, weather = "sunny")
    if !self.full?
      if weather == "sunny"
        @planes << plane
      else
        raise("CANNOT LAND. THE WEATHER IS STORMY.")
      end
    else
      raise("CANNOT LAND. THIS AIRPORT IS FULL.")
    end
  end
  def takeoff(plane, weather = "sunny")
    if weather == "sunny"
      @planes.delete(plane)
    else
      raise ("CANNOT TAKEOFF. THE WEATHER IS STORMY.")
    end
  end
  def full?
    @planes.length == @capacity ? true : false
  end
end
