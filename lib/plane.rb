class Plane

  attr_reader :landed

  def land(airport)
    airport.port_plane(self)
    @landed = true
  end

  def take_off(airport)
    airport.release_plane
    @landed = false
  end

end
