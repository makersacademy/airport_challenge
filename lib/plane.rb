require_relative "airport"

class Plane
  def land(airport)
    airport.receive_plane(self)
  end

  def take_off(airport)
    airport.release_plane(self)
    return "Plane has departed the airport"
  end
end
