require_relative 'airport'
class Plane

  def land(airport)
    airport.inventory.push(self)
    return "your plane has landed at the airport"
  end


  def take_off(airport)
    airport.inventory = airport.inventory - [self]
    return "your plane has taken off from the airport"
  end
end
