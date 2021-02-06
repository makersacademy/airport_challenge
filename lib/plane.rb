class Plane

  def land(airport)
  end

  def take_off(airport)
    airport.planes.delete(self)
  end

end
