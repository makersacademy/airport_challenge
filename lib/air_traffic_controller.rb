require_relative 'weather'
require_relative 'airport'
require_relative 'plane'

class AirTrafficController
  attr_reader :weather
  AVAILABLE_AIRPORTS = [:LHR, :LTN, :LGW]

  def initialize
    @weather = Weather.new
  end

  def tell_plane_to_land(airport, plane)
    raise("Bad weather at #{airport.iata_code}, cannot land plane!") if weather.good_weather?(airport) == false

    raise("#{airport.iata_code} at capacity, cannot land plane!") if airport.airport_at_capacity? == true

    plane.cleared_to_land(airport)
    log_action("#{plane} cleared for landing at #{airport.iata_code}")
  end

  def tell_plane_to_depart(airport, plane)
    raise("Bad weather at #{airport.iata_code}, plane cannot take off!") if weather.good_weather?(airport) == false

    raise("Plane not at airport!") if airport.plane_departure_ready?(plane) == false

    plane.cleared_for_take_off(airport)
    log_action("#{plane} cleared for take off from #{airport.iata_code}")
  end

  def log_action(action)
    File.open("./logs/log.txt", 'a') { |line| line.write "#{Time.now} - User: #{object_id} - Action: #{action}\n" }
  end
end
