class Plane

  def land(airport)
    raise "Can't land again." if @landed
    airport.park_plane(self)
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off(airport)
    airport.unpark_plane(self)
    @landed = false
    self
  end

end
