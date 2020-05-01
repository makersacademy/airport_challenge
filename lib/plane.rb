require_relative 'airport'

class Plane

  def land(airport)
    airport.inventory.push(self)
  end
end