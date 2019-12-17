require_relative 'weather'
require_relative 'airport'
require_relative 'plane'

class AirTrafficController
  attr_reader :weather
  AVAILABLE_AIRPORTS = [:LHR, :LTN, :LGW]

  def initialize
    @weather = Weather.new
  end

  def tell_plane_to_land(args)
    airport = args[:airport]
    plane = args[:plane]
    weather_check(airport, 'land')

    raise("#{airport.iata_code} at capacity, cannot land plane!") if airport.airport_at_capacity? == true

    plane.cleared_to_land(airport)
    log_action(airport, plane, 'landing at')
  end

  def tell_plane_to_depart(args)
    airport = args[:airport]
    plane = args[:plane]
    weather_check(airport, 'take off')

    raise("Plane not at airport!") if airport.plane_departure_ready?(plane) == false

    plane.cleared_for_take_off(airport)
    log_action(airport, plane, 'take off from')
  end

  private

  def log_action(airport, plane, action)
    File.open("./logs/log.txt", 'a') { |line| line.write "#{Time.now} - User: #{object_id} - Action: Flight #{plane.flight_id} cleared for #{action} #{airport.iata_code}\n" }
  end

  def weather_check(airport, action)
    raise("Bad weather at #{airport.iata_code}, plane cannot #{action}!") if weather.good_weather? == false
  end

end
