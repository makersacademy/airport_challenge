require_relative "airport"

class Plane
  def land(airport)
    airport.receive_plane(self)
  end
end
