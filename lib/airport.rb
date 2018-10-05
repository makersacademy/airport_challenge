class Airport

  def land(plane)
    plane.set_status("land")
  end

  def takeoff(plane)
    true
  end

  def statuscheck(plane)
    true
  end

  def prevent_takeoff(plane)
    true
  end

  def check_weather(airport)
    true
  end

  def prevent_landing(plane)
    true
  end

  def check_capacity(airport)
    true
  end

  def set_capacity(airport)
    true
  end
end
