require_relative 'airport'

class Plane

  def land(airport)
    fail "Airport is full." if airport.full?
    fail "Weather is stormy. Cannot land." if airport.stormy?
    airport.landed_planes << self
    airport
  end

  def take_off(airport)
    fail "Weather is stormy. Cannot take off." if airport.stormy?
    airport.landed_planes.delete(self)
    confirm = "#{self} has left #{airport}."
    confirm if airport.landed_planes.include?(self) == false
  end

end
