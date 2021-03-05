require 'airport'

class Plane
  attr_accessor :name, :airport

  def initialize(airport = nil, name = 'boeing747')
    @name = name
    @airport = airport
  end

  def land(airport)
    airport.arrive(self)
    @airport = airport
  end

  def take_off
    @airport.depart(self)
    @airport = nil
  end
end
