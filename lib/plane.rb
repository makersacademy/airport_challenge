class Plane
  
  def land(airport)
    @landed = true
    airport.land(self)
  end

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end
end
