class Plane
  def in_airport?
    true
  end
  
  def take_off(plane)
    plane.in_airport?
    return false
  end
end
