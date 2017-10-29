class Plane
  def land(airport)
    airport.landed_planes << self
  end
end
