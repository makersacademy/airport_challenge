require 'airport'

class Plane
  def land(airport)
    airport.incoming_plane(self)

  end
end
