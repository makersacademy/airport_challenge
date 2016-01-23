require_relative 'airport'

class Plane

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
    raise "Airport at capacity" if airport.at_capacity?
    airport.planes << self
    @airborne = false
  end

  def landed?
    @airborne? false : true
  end

end
