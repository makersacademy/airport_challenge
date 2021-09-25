class Airport
  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 1
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  def land(plane, weather = "sunny")
    if plane.position == "air"
      if !self.full?
        if weather == "sunny"
          @planes << plane
          plane.change_position
        else
          raise("CANNOT LAND. THE WEATHER IS STORMY.")
        end
      else
        raise("CANNOT LAND. THIS AIRPORT IS FULL.")
      end
    else
      raise("CANNOT LAND. THIS PLANE IS ON THE GROUND.")
    end
  end
  def takeoff(plane, weather = "sunny")
    if self.planes.find_index(plane) != nil
      if plane.position == "ground"
        if weather == "sunny"
          @planes.delete(plane)
          plane.change_position
        else
          raise("CANNOT TAKEOFF. THE WEATHER IS STORMY.")
        end
      else
        raise("CANNOT TAKEOFF. THIS PLANE IS IN THE AIR.")
      end
    else
      raise("CANNOT TAKEOFF. THIS PLANE IS NOT AT THIS AIRPORT")
    end
  end
  def full?
    @planes.length == @capacity ? true : false
  end
end
