class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @all_planes = []
    @weather = Weather.new
  end

  def land_plane(plane)
    fail "It is too stormy to land" if @weather.stormy?
    fail "Airport is full" if full?
    @all_planes << plane # appends Plane object to @all_planes
    @all_planes.last # returns last element of @all_planes
  end

  def takeoff_plane
    fail "It is too stormy to take off" if @weather.stormy?
    plane = @all_planes.pop # returns and removed last element of @all_planes
    !at_airport?(plane) # not at airport?
  end

  # return true if plane is not in @all_planes array
  def at_airport?(plane)
    !@all_planes.include?(plane)
  end




  def full?
    @all_planes.size >= DEFAULT_CAPACITY
  end

end

