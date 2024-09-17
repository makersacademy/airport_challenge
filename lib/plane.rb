class Plane

  def initialize(flying = false)
    @flying = flying
  end

  def flying?
    @flying
  end

  def land_at_airport(airport)
    airport.land_plane(self)
    @flying = false 
  end

  def takeoff_from_airport(airport)
    airport.send_plane(self)  
    @flying = true
  end

end
