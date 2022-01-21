class Plane

  def initialize(flying = false)
    @flying = flying
  end

  def flying?
    @flying
  end

  def land_at_airport(airport)
    if airport.land_plane(self)
      @flying = false 
    end
  end

  def takeoff_from_airport(airport)
    if airport.send_plane(self)  
      @flying = true
    end
  end

end
