class Airport
  #DEFAULT_CAPACITY = 20

  def initialize
    @all_planes = []
  end

  def land_plane(plane)
    @all_planes << plane
    @all_planes.last
  end

  def takeoff_plane
    @all_planes.pop
  end
end

class Weather
  def stormy?
    return true if rand < 0.1

    false
  end
end

class Plane

end