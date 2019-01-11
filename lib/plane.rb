class Plane
  def land(airport)
    airport.planes << self if airport.permission_land?
  end

  def depart(airport)
    airport.planes.delete(self) if airport.permission_depart?
  end
end
