require "./safety"
require "weather"

class AirTrafficController
  DEAFAULT_CAPACITY = 5

  def initialize
  @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def take_off
    @airport.pop
    @airport
  end

end

class Plane
end
