require_relative 'airport'

class Plane
  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def take_off(airport)
    @flying = true if airport.allow_take_off(self)
  end

  def land(airport) 
    @flying = false if airport.receive(self)
  end
end
