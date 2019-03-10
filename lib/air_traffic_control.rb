class AirTrafficControl

  def land(plane, airport)
    plane.location = airport
  end

  def take_off(plane)
    plane.location = "N/A"
  end

  def confirm_plane_absence(plane, airport)
    plane.location != airport
  end

end
