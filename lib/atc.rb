class Atc

  def auth_landing(aircraft, airport, airport_code)
    airport.airport_landing(aircraft)
    aircraft.land_aircraft(airport_code)
  end

end
