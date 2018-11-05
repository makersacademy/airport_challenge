class Plane

  def land(airport)
    fail 'Plane cannot land as there is no room' if airport.full?
    fail 'Stormy so the plane cannot land' unless airport.check_weather?
    airport.plane_is_added_to_available_fleet(self)
    return "The plane has landed at #{airport}"
  end

  def takeoff(airport)
    fail 'Stormy so the plane cannot take off' unless airport.check_weather?
    fail 'Plane is not in the airport' unless airport.plane_in_airport?(self)
    airport.plane_is_removed_from_available_fleet(self)
    return "The plane has taken off from #{airport}"
  end
end
