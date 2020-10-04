class Airport
  AIRPORT_CAPACITY = 3
  def initialize(airport_name)
    @hangar = [ ]
    @airport_name = airport_name
  end

  def land(plane)
    raise 'airport full' unless @hangar.length < 3
    @hangar << plane
  end

  def depart(plane)
    @hangar.delete(plane)
    "Plane #{plane} has left #{@airport_name}"
  end
end
