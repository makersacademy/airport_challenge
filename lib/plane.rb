require_relative 'airport'

class Plane
  def land(airport)
    fail 'WARNING stormy weather at airport abort landing' if airport.stormy == true
    fail "WARNING airport is full, no space to land" if airport.planes.count == airport.capacity
    p 'Airport capacity'
    p airport.capacity
    p 'Airport planes size'
    p airport.planes.size
    airport.planes << self
    'Plane has landed safely!'
  end
  def take_off(airport)
    fail 'WARNING too stormy to take off, abort take off' if airport.stormy == true
    'Plane has taken off safely!'
  end
end
