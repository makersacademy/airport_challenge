require_relative 'airport2'

class Plane

  def initialize
    @airport
    @flying = true
  end

  def land(airport)
    airport.landed_planes << self
    fail "Airport is full" if airport.full?
    fail "Airport is stormy" if airport.stormy?
    # fail "Plane has already landed" if @flying == false
  end

  def take_off(airport)
    fail "Airport is stormy" if airport.stormy?
    airport.landed_planes.delete(self)
    confirm = "#{self} has taken off from #{airport}"
    confirm if airport.landed_planes.delete(self) == true


    # fail "Plane is already in air" if @flying == true
  end

end
