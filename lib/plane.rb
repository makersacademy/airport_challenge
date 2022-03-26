require_relative './airport'

class Plane
  def land(airport)
    airport.hangar.push(self)
  end

  def take_off(airport)
    puts "#{self} has left #{airport}"
    airport.hangar.delete(self)
  end
end
