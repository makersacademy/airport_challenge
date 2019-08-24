require_relative "airport"

class Plane
  def land(airport)
    airport.receive_plane(self)
  end

  def take_off
  end
end
