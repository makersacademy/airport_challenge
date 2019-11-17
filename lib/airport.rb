class Airport
  
  def initialize(capacity)
    @plane_counter = 0
    @capacity = capacity
  end

  def land_plane(plane)
    if @plane_counter == @capacity
      fail "Airport is full"  
    end 
    @plane_counter += 1
    plane
  end

  def take_off_plane(plane)
    plane
  end

  def weather
    @weather
  end 


  def parked_planes_count
    @plane_counter
  end

end
