require_relative "plane"

class Airport

  def planes
    
  end

  def land(plane)
    fail "Plane has already landed" if is_flying?(plane)
    plane.land_plane
  end

  def is_flying?(plane)
    plane.landed?
  end

end
