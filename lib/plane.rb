class Plane

  def land(airport)
    airport.planes.push(self)
  end

  def take_off(airport)
    airport.planes.delete(self)
  end

end
