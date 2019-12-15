class Weather
  def initialize
    @airports = [:LHR, :LTN, :LGW]
  end

  def good_weather?(airport)
    code = airport.iata_code
    return rand(@airports.length) == @airports.index(code)
  end
end
