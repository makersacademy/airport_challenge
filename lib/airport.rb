class Airport

  def land(plane)
    plane.location = self
    plane
  end

  def take_off(plane)
    plane.location = "in_the_air"
  end

end
