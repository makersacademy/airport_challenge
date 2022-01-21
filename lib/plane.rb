class Plane

  def initialize(flying = false)
    @flying = flying
  end

  def flying?
    @flying
  end

  def land_at_airport(airport, weather)
    airport.land_plane(self, weather)
    @flying = false 
  end

  def takeoff_from_airport(airport, weather)
    airport.send_plane(self, weather)  
    @flying = true
  end

end
