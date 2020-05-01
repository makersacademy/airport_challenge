require_relative 'airport'
class Plane

  def land(airport)
    if airport.inventory.length < 2
    airport.inventory.push(self)
    p "your plane has landed at the airport"

    else
      p "This airport has reached it's capacity. Try landing at a different airport"
    end
  end


  def take_off(airport)
    airport.inventory = airport.inventory - [self]
    return "your plane has taken off from the airport"
  end
end
