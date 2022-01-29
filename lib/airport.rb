class Airport
  def land(plane)
    plane
    "Landed"
  end
  
  def take_off
    plane = Plane.new(flying = true)
    return plane
  end
end
