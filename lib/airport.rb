class Airport
  
  def initialize(capacity)
    @capacity = capacity
    @ramp = []
  end

  def land_plane(plane)
    if parked_planes_count == @capacity
      fail "Airport is full"  
    end 

    plane.land
    @ramp << plane
  end

  def take_off_plane(plane)
    unless @ramp.include?(plane)
      fail "Plane never landed here in the first place"
    end

    plane.take_off
    @ramp.delete(plane)
  end

  def parked_planes_count
    @ramp.length
  end

  def weather
    @weather
  end

end
