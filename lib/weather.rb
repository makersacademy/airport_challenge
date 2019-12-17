class Weather
  def good_weather?(airport) #no need to hash arguments since only used internally by AirTrafficController
    code = airport.iata_code
    return rand(AirTrafficController::AVAILABLE_AIRPORTS.length) != AirTrafficController::AVAILABLE_AIRPORTS.index(code)
  end
end
