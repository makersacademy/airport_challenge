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

end
