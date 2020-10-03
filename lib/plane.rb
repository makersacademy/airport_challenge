require 'airport'

class Plane

  def land(airport)

    airport.hangar.push(self)

  end
end
