require_relative 'airport'
require_relative 'weather'

class Plane
  attr_accessor :flying

  def initialize
    @flying = false
  end

  def take_off(airport)
    airport.take_off(self)
  end

  def land(airport)
    airport.land(self)
  end

end
