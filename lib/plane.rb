class Plane

  def land(airport)
    raise "It is stormy. We can't land the plane." if self.weather == 0
    raise "Can't land again." if @landed
    airport.park_plane(self)
    @taken_off = false
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off(airport)
    raise "It is stormy. We can't take off." if self.weather == 0
    raise "Can't take off again." if @taken_off
    airport.unpark_plane(self)
    @taken_off = true
    @landed = false
    self
  end

  def taken_off?
    @taken_off
  end

  def weather
    #returning 0 should happen around 1/3
    rand(0..2)
  end

end
