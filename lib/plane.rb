class Plane

  def land(airport)
    print "The plane has landed at #{airport}"
  end

  def takeoff(airport)
    if airport.check_weather_and_if_OK_take_off?
      if airport.plane_in_airport?(self)
      airport.plane_is_removed_from_available_fleet(self)
        return "The plane has taken off from #{airport}"
      else
        return "The plane is not in the airport"
    end
    end
    return "It is raining, so the plane can't take off"
  end
end
