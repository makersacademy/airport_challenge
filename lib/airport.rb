class Airport

  attr_reader :plane_storage
  attr_reader :plane_capacity
  DEFAULT_CAPACITY = 10

  def initialize(plane_capacity = DEFAULT_CAPACITY)
    @plane_storage = []
    @plane_capacity = plane_capacity 
  end

  def land_plane(plane)
    fail "Storage full" if full?
    plane_storage.push(plane)
  end

  def send_plane(plane)
    fail "Plane not in storage" unless plane_storage.include? plane
    @plane_storage.delete(plane)
  end

  def full?
    return plane_storage.size >= plane_capacity
  end
end
