require_relative 'airport'
require_relative 'plane'

class AirTrafficControl

  def approve_landing?(plane, destination_airport)
    if destination_airport.bad_weather?
      fail bad_weather_message
    elsif destination_airport.full?
      fail "#{destination_airport.name} is full!"
    end
    true
  end

  def approve_takeoff?(plane, airport)
    fail bad_weather_message if airport.bad_weather?
    true
  end

  def bad_weather_message
    "Bad weather, try again later!"
  end

end
