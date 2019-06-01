class Airport
  def initialize
    @capacity = 10
    @planes = []
  end

  def capacity
    @capacity
  end

  def planes
    @planes
  end

  def capacity=(num_of_planes)
    @capacity = num_of_planes
  end

  def add_plane(plane)
    @planes.push(plane)
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def plane_at_airport?(plane)
    return false
  end
end