class Airport
  def initialize(airport_name)
    @hangar = []
    @airport_name = airport_name
  end

  def land(plane)
    @hangar << plane
  end

  def depart(plane)
    @hangar.delete(plane)
    "Plane #{plane} has left #{@airport_name}"
  end
end
