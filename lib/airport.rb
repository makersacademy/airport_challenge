class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    "Plane has landed"
  end

  def takeoff(plane)
    @hangar.delete(plane)
  end
end
