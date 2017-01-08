require_relative 'airport.rb'

class Plane
  attr_accessor :flying

  def take_off(airport)
    airport.take_off(self)
  end

  def land(airport)
    airport.land(self)
  end

end
