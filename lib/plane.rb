require_relative './airport.rb'

class Plane

  def land(airport)
    raise 'airport full' if airport.hanger.count == airport.DEFAULT_CAPACITY
    raise 'landing denied, there is a storm!' if airport.storm == true
    airport.hanger << self
  end

  def take_off(airport)
    raise 'take-off denied, there is a storm!' if airport.storm == true
    airport.hanger.select! { |plane| plane != self } 
  end
end