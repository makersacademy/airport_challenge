require 'air_traffic_controller'

class Weather
  def good_weather?(airport)
    code = airport.iata_code
    return rand(AirTrafficController::AVAILABLE_AIRPORTS.length) != AirTrafficController::AVAILABLE_AIRPORTS.index(code)
  end
end
