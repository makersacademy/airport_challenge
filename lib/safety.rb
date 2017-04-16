module Safety

  def weather_check(weather = Weather.new)
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

  def landing_safety_check(airport, plane)
    if airplane_airborne(plane) == "negative"
      "#{plane.name} already on the ground"
    elsif airport_capacity_check(airport) == "negative"
      "Landing aborted: #{airport.name} full"
    else
      "safety checks passed"
    end
  end

  def take_off_safety_check(airport, plane)
    if airplane_present(airport, plane) == "negative"
      "Take Off not possible: #{plane.name} not present"
    else
      "safety checks passed"
    end
  end

end
