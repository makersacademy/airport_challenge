class Plane

  attr_reader :flying

  def initialize(flying = false)
    @flying = flying
  end

  def attempt_land(airport)
    airport.land(self)
    @flying = false
  end

  def attempt_take_off(airport)
    airport.take_off(self)
    @flying = true
  end

end
