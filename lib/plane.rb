require_relative 'airport'
require_relative 'weather'

class Plane

  include Weather

  attr_reader :airborne

  def initialize
    @airborne = false
  end

  def takeoff(airport)
    airport.planes.delete(self)
    self
    @airborne = true
  end

  def land(airport)
    fail "Airport at capacity" if airport.at_capacity?
    fail "Weather is too stormy!" if airport.weather > 85
    airport.planes << self
    @airborne = false
  end

  def landed?
    @airborne? false : true
  end

end
