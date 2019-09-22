class Airport
  def take_off(plane)

  end

  def land(plane)
    Plane.new
  end

  def full?(number_of_planes)
    number_of_planes > 10 ? true : false
  end

  def plane_in_airport?
    true
  end

end
