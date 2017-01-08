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
    check_capacity
    planes.push(plane)
  end

  def release_plane(plane)
    planes.delete(plane)
  end

  private

  def check_capacity
    fail "Airport is currently full." unless planes.length < capacity
  end

end
