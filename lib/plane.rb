class Plane

  attr_reader :is_flying

  def initialize
    @is_flying = true
  end

  def land(airport)
    fail "This plane is already landed" unless is_flying
    airport.approve_landing?(self)
    @is_flying = false
    "Landed at #{airport.name}!"
  end

  def take_off(airport)
    fail "This plane is already flying" if is_flying
    airport.approve_takeoff?(self)
    @is_flying = true
    "Taking off!"
  end

  

end
