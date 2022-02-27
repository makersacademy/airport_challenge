require './lib/airport'

class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    @flying = false if airport.receive(self)
  end

  def take_off(airport)
    @flying = true if airport.release(self)
  end

  def flying?
    @flying
  end
  
end