class Plane

  attr_reader :is_flying

  def initialize
    @is_flying = true
  end

  def land(traffic_control, airport)
    fail "This plane is already landed!" unless is_flying
    traffic_control.approve_landing?(self, airport)
    @is_flying = false
    airport.planes << self
    "Landed at #{airport.name}!"
  end

  def take_off(traffic_control, airport)
    if is_flying
      fail "This plane is already flying!"
    elsif !airport.planes.include?(self)
      fail "This plane is not at #{airport.name}!"
    end
    traffic_control.approve_takeoff?(self, airport)
    @is_flying = true
    airport.planes.delete(self)
    "Taking off from #{airport.name}!"
  end

end
