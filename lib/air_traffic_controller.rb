require "./safety"
require "./weather"

class AirTrafficController

  def initialize(safety_protocol, weather_station ,currently_landed=[],currently_flying=[])
    @safety_protocol = safety_protocol
    @airport = currently_landed
    @currently_flying = currently_flying
    @weather_station = weather_station
  end

  def land(plane)
     land_airport_check(plane)
     @currently_flying.delete(plane) if is_this_plane_flying_already?(plane)
     @airport << plane
     puts 'Plane landed succesfuly! There is now #{@airport.count} planes in the airport'
     @airport
  end

  def take_off(plane)
    take_off_airport_check(plane)
    @airport.delete(plane)
    @currently_flying << plane
  end

  def land_airport_check(plane)
    raise 'This plane is at the airport already' if is_this_plane_in_the_airport_already?(plane)
    @safety_protocol.is_landing_safe?(@airport.count, @weather_station.generate_weather)
  end

  def take_off_airport_check(plane)
    @safety_protocol.is_landing_safe?(@airport.count, @weather_station.generate_weather)
    raise 'This plane is currently flying' if is_this_plane_flying_already?(plane)
    raise 'This plane is not in this airport' if is_this_plane_in_the_airport_already?(plane) == false
  end

  def is_this_plane_in_the_airport_already?(plane)
     @airport.include?(plane)
  end

  def is_this_plane_flying_already?(plane)
   @currently_flying.include?(plane)
  end
 end

class Plane
end
