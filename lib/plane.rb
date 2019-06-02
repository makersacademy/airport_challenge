class Plane
  def land_at(airport)
    airport.landed_planes << self
  end  
end
