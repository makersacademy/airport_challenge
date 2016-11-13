class Plane

  def land(airport)
    airport.park_plane(self)
  end

  def landed?
    true
  end

  def take_off(airport)
    airport.unpark_plane(self)
    self
  end

end
