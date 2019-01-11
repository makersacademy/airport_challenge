class Plane
  def land(airport)
    airport.planes << self if airport.permission?
  end

  def depart(airport)
    airport.planes.delete(self) if airport.permission?
  end
end
