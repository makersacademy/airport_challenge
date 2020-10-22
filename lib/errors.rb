class Errors
  def land(plane, airport)
    fail "Plane has already landed at #{plane.airport}." unless plane.flying
    fail "Airport is full." if airport.full?
    fail "Weather is stormy. Cannot land." if airport.weather
  end

  def take_off(plane, airport)
    fail "This plane is already flying." if plane.flying
    fail "This plane is not at the specified airport." unless airport.at_airport?(plane)
    fail "Weather is stormy. Cannot take off." if airport.weather
  end
end
