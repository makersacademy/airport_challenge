class AirTrafficControl

  def land(plane, airport)
    plane.location = airport
  end

  def take_off(plane)
  end

  def confirm_plane_absence(plane, airport)
    plane.location != airport
  end

end
