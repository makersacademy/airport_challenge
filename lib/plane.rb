require_relative "./airport"

class Plane

  def initialize
    @plane
  end

  def land(plane)
    plane
  end

  def take_off(plane, airport)
    airport.remove_plane(plane)
  end

  def full?

  end

end
