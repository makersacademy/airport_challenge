module Safety

  def weather_check(weather)
    if weather.status == "sunny"
      "check"
    else
      "negative"
    end
  end

  def airport_capacity_check(airport)
    if !airport.full?
      "check"
    else
      "negative"
    end
  end

  def airplane_present(airport, plane)
    plane = plane
    if airport.plane_present(plane)
      "check"
    else
      "negative"
    end
  end

  def airplane_airborne(plane)
    if plane.status == "airborne"
      "check"
    else
      "negative"
    end
  end

  def landing_safety_check(airport, plane, weather)
    (weather_check(weather) == "check") &&
    (airport_capacity_check(airport) == "check") &&
    (airplane_airborne(plane) == "check")
  end

  def take_off_safety_check(airport, plane, weather)
    (weather_check(weather) == "check") &&
    (airplane_present(airport, plane) == "check")
  end

end
