require_relative 'airport'

class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def takeoff(airport)
    fail "Weather is too stormy!" if airport.weather_conditions > 85
    airport.planes.delete(self)
    self
    @airborne = true
  end

  def land(airport)
    fail "Airport at capacity" if airport.at_capacity?
    fail "Weather is too stormy!" if airport.weather_conditions > 85
    fail "Plane is already in an airport" if landed?
    airport.planes << self
    @airborne = false
  end

  def landed?
    @airborne? false : true
  end

end
