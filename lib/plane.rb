require_relative './airport.rb'

class Plane

  def land(airport)
    airport.hanger << self
  end

  def take_off(airport)
    airport.hanger.select! { |plane| plane != self } 
  end
end