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

  def move_to(airport)
    raise "This plane is flying, it must be landed, not moved." if flying
    airport.store(self)
  end

end
