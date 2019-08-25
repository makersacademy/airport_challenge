class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_reader :all_planes
  attr_reader :weather

  # initialise Airport instance
  def initialize
    @all_planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACITY
  end

  # lands plane after checking #stormy? / #full? / #at_airport?
  def land_plane(plane)
    fail "It is too stormy to land" if weather.stormy?
    fail "Airport is full" if full?
    fail "Plane is already at airport!" if at_airport?(plane)
    all_planes << plane # appends Plane object to all_planes
    at_airport?(plane) # confirms plane is at airport
  end

  # takes off plane after checking #stormy? !#at_airport?
  def takeoff_plane(plane)
    fail "It is too stormy to take off" if weather.stormy?
    fail "Plane is not at airport!" if !at_airport?(plane)
    all_planes.delete(plane) # returns and removed last element of @all_planes
    !at_airport?(plane) # not at airport?
  end

  private

  # return true if plane is in airport (a.k.a @all_planes array)
  def at_airport?(plane)
    all_planes.include?(plane)
  end

  # return true if airport is full
  def full?
    all_planes.size >= capacity
  end
end