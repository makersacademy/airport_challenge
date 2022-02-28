require_relative './airport'

class Plane

  def initialize
    @current_airport = nil
    @flying = true
  end

  def land(airport)
    raise 'error, plane is not flying' if @flying == false
    raise 'airport full' if airport.hanger.count == airport.DEFAULT_CAPACITY
    raise 'landing denied, there is a storm!' if airport.storm == true
    @current_airport = airport
    @flying = false
    airport.hanger << self
  end

  def take_off(airport)
    raise 'plane is not in the specified airport' if airport != @current_airport
    raise 'take-off denied, there is a storm!' if airport.storm == true
    @flying = true
    airport.hanger.reject! { |plane| plane == self }

  end
end
