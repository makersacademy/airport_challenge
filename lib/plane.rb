class Plane
  
  def land(airport)
    airport.land(self)
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end
end
