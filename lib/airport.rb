class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @all_planes = []
  end

  def land_plane(plane)
    fail "It is too stormy to land" if stormy?

    @all_planes << plane # appends Plane object to @all_planes
    @all_planes.last # returns last element of @all_planes
  end

  def takeoff_plane
    fail "It is too stormy to take off" if stormy?

    plane = @all_planes.pop # returns and removed last element of @all_planes
    confirm_takeoff_plane(plane)
  end

  # return true if plane is not in @all_planes array
  def confirm_takeoff_plane(plane)
    return false if @all_planes.include? plane

    true
  end

  def stormy?
    return true if rand < 0.1

    false
  end

  def full?

  end

end


class Plane

end