class Plane
  def land(airport)
    airport.planes << self
  end

  def depart(airport)
    airport.planes.delete(self)
  end
end
