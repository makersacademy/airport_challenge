class Airport
  
  def initialize(capacity)
    @plane_counter = 0
    @capacity = capacity
  end

  def land_plane(plane)
    if @plane_counter == @capacity
      fail "Airport is full"  
    end 

    unless plane.in_flight? 
      fail "Plane already at the airport"
    end

    plane.land
    @plane_counter += 1
    
  end

  def take_off_plane(plane)
    if plane.in_flight?
      fail "Plane already departed"
    end
    
    plane.take_off
    @plane_counter -= 1
  end

  def parked_planes_count
    @plane_counter
  end

  def weather
    @weather
  end

end
