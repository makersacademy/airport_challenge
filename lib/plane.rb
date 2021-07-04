require_relative 'airport'

class Plane
  def land(airport)
    airport.hangar << self
  end

  def take_off(airport)
    airport.hangar.delete(self)
    puts "#{self} has left the #{airport}"
  end
end