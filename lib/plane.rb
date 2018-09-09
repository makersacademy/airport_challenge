require './lib/airport'

class Plane
  def land(airport)
    fail "Sorry, this airport is full" if airport.full?
    airport.planes << self
  end
  def take_off(airport)
    airport.planes.delete(self)
    puts "#{self} has taken off from #{airport}."
  end
end
