require_relative "Airport"

class Plane

  def initialize
    @flying = true
  end
  
  def flying?
    flying
  end

  def take_off
    self.flying = true
  end

  def land_at(airport)
    fail "Plane already grounded" if !flying?
    self.flying = false
    airport.land(self)
  end

  private

  attr_accessor :flying

end
