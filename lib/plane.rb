class Plane

  attr_accessor :airborne

  def initialize
    @airborne = true # a new plane assumed airborne upon instantiation
  end

  def land(airport)
    airport.planes << self
    self.airborne = false
  end

  def take_off(airport)
    self.airborne = true
  end

  def airborne?
    airborne
  end


end
