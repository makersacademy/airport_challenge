require_relative "plane"

class Airport

  def initialize
    @planes_array = []
  end

  def planes
    @planes_array
  end

  def land(plane)
    fail "Plane has already landed" if flying?(plane)
    plane.land_plane
    @planes_array.push(plane)
  end

  def take_off(plane)
  end

  def flying?(plane)
    plane.landed?
  end

end
