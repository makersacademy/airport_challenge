class AirTrafficController

  def bad_weather?(weather)
    weather != "Sunny" 
  end

  def request_status(plane)
    plane.airport
  end

  def approval(weather)
    fail 'denied - inappropriate weather' if bad_weather?(weather)
  end

  def flight_approval(plane, weather)
    approval(weather)
    plane.flight_approval = true
  end

  def land_approval(plane, weather, airport)
    approval(weather)
    fail 'denied - no space at airport' unless airport.spaces.include? nil
    plane.land_approval = true
  end
end
