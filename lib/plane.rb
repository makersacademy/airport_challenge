class Plane

  def land(airport)
    airport.land(self)
    @location = airport
    @flying = false
  end

  def take_off
    @location.take_off(self)
    @location = nil
    @flying = true
  end

  def flying?
    @flying
  end

end
