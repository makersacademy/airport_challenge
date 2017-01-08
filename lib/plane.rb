require_relative 'airport.rb'

class Plane
  attr_accessor :flying

  def take_off(airport)
    @flying = false
    airport.take_off(self)
  end

  def land(airport)
    @flying = true
    airport.land(self)
  end

end
