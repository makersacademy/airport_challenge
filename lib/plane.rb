class Plane

  def take_off(airport)
    @airborne = true
    airport.planes.delete(self)
  end

  def airborne?
    @airborne
  end

end
