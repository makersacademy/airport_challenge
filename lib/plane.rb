class Plane

  def land(airport)
    airport.planes << self
    "Plane landed!"
  end
  
end
