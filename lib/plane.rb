class Plane

  def land(airport)
    raise "Can't land again." if @landed
    airport.park_plane(self)
    @taken_off = false
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off(airport)
    raise "Can't take off again." if @taken_off
    airport.unpark_plane(self)
    @taken_off = true
    @landed = false
    self
  end

  def taken_off?
    @taken_off
  end

end
