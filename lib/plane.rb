require_relative 'airport'

class Plane
  def land(airport)
    airport.recieve_plane(self)
  end
end
