class Plane
  def land(airport)
    # Stores plane at airport given permission
    airport.planes << self if airport.landing_permission?
  end

  def depart(airport)
    # Removes plane from airport given permission
    airport.planes.delete(self) if airport.permission?
  end
end
