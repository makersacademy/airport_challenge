require_relative 'weather.rb'

class Airport

  attr_reader :airport_storage
  attr_reader :plane_capacity
  DEFAULT_CAPACITY = 10

  def initialize(plane_capacity = DEFAULT_CAPACITY)
    @airport_storage = []
    @plane_capacity = plane_capacity 
  end

  def land_plane(plane)
    fail "Storage full" if full?
    fail "Plane not flying" unless plane.flying?
#   fail "Too stormy" if is_stormy
    airport_storage.push(plane)
    return true
  end

  def send_plane(plane)
    fail "Plane not in storage" unless airport_storage.include? plane
    fail "Plane already flying" if plane.flying?
#    fail "Too stormy" if is_stormy
    @airport_storage.delete(plane)
    return true
  end

  def full?
    return airport_storage.size >= plane_capacity
  end

end
