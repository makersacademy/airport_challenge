class Plane

  def land(airport)
    fail 'Plane cannot land as there is no room' if airport.planes_in_airport.length >= airport.plane_capacity
    fail 'It is raining so the plane cannot land' unless airport.check_weather_is_fine?
    airport.plane_is_added_to_available_fleet(self)
    return "The plane has landed at #{airport}"
  end

  def takeoff(airport)
    fail 'It is raining so the plane cannot take off' unless airport.check_weather_is_fine?
    fail 'The plane is not in the airport' unless airport.plane_in_airport?(self)
    airport.plane_is_removed_from_available_fleet(self)
    return "The plane has taken off from #{airport}"
  end
end
