class Atc

  def auth_landing(aircraft, airport, airport_code)
    met_office = Weather.new
    return fail "Poor weather. Airport closed." unless met_office.forecast == "fine"

    airport.aircraft_arriving(aircraft)
    aircraft.land_aircraft(airport_code)
  end

  def auth_takeoff(aircraft, airport, airport_code)
    met_office = Weather.new
    return fail "Poor weather. Airport closed." unless met_office.forecast == "fine"

    airport.aircraft_departing(aircraft.registration)
    aircraft.takeoff(airport_code)
    return true
  end

end
