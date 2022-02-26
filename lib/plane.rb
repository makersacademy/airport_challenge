require_relative './airport.rb'

class Plane

  def land(airport)
    raise 'airport full' if airport.hanger.count == airport.DEFAULT_CAPACITY
    airport.hanger << self
  end

  def take_off(airport)
    airport.hanger.select! { |plane| plane != self } 
  end
end