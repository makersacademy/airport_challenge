class Airport
  attr_reader :capacity, :planes

  def initialize
    @capacity = 1
    @planes = []
  end

  def override_capacity(new_capacity)
    @capacity = new_capacity
  end

  def store_plane(plane)
    fail "Airport is currently full." unless planes.length < capacity
    planes.push(plane)
    return planes
  end

  def release_plane(plane)
    planes.delete(plane)
    return planes
  end

end
