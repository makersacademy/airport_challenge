require_relative 'airport'

class Plane
  def land(airport)
    (raise "Cannot land - Airport full") if airport.full? == true
    airport.hangar << self
    
  end

  def take_off(airport)
    airport.hangar.delete(self)
    puts "#{self} has left the #{airport}"
  end
end