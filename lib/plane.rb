require_relative './airport.rb'
require_relative 'weather'

class Plane
  def land(airport)
    airport.planes << self
    airport
  end

  def take_off(airport)
    airport
  end
end
