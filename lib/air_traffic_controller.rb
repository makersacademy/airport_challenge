require "./safety"
require "weather"

class AirTrafficController


  def initialize(safety_protocol, current_weather)
  @safety_protocol = safety_protocol
  @airport = []
  @current_weather = current_weather
  end

  def land(plane)
    @safety_protocol.is_landing_safe?(@airport.count, @current_weather)
    @airport << plane
  end

  def take_off
    @airport.pop
    @airport
  end

end

class Plane
end
