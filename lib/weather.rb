class Weather
  AVAILABLE_AIRPORTS = [:LHR, :LTN, :LGW]

  def good_weather?(airport)
    code = airport.iata_code
    return rand(AVAILABLE_AIRPORTS.length) == AVAILABLE_AIRPORTS.index(code)
  end
end
