require_relative 'weather'

class AirTrafficController
  AVAILABLE_AIRPORTS = [:LHR, :LTN, :LGW]

  def initialize
    @weather = Weather.new
  end

  def tell_plane_to_land(airport, plane)
    raise("Bad weather at #{airport.iata_code}, cannot land plane!") if @weather.good_weather?(airport) == false
    raise("#{airport.iata_code} at capacity, cannot land plane!") if airport.airport_at_capacity? == true
    plane.cleared_to_land(airport)
  end

  def tell_plane_to_depart(airport, plane)
    raise("Bad weather at #{airport.iata_code}, plane cannot take off!") if @weather.good_weather?(airport) == false
  end

  
end
