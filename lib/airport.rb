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
    fail "Plane not flying" unless plane.flying?
#    fail "Weather too stormy" if is_stormy?
    plane_storage.push(plane)
    plane.land
  end

  def send_plane(plane)
    fail "Plane not in storage" unless plane_storage.include? plane
    fail "Plane already flying" if plane.flying?
#    fail "Weather too stormy" if is_stormy?
    @plane_storage.delete(plane)
  end

  def full?
    return plane_storage.size >= plane_capacity
  end

#  def is_stormy?
#    storm_chance = 10
#    return (Array.new(100 - storm_chance, false) + Array.new(storm_chance, true)).sample
#  end
end
