class Airport
  
  def initialize(capacity)
    @capacity = capacity
    @ramp = []
  end

  def land_plane(plane)
    if parked_planes_count == @capacity
      fail "Airport is full"  
    end 

    fail "Weather is stormy, landing not possible" if weather == :stormy

    plane.land
    @ramp << plane

  end

  def take_off_plane(plane)
    unless @ramp.include?(plane)
      fail "Plane never landed here in the first place"
    end

    
    fail "Weather is stormy, take off not possible" if weather == :stormy
    
    plane.take_off
    @ramp.delete(plane)

  end

  def parked_planes_count
    @ramp.length
  end

  def weather
    if rand(10) > 3
      :sunny
    else
      :stormy
    end
  end

end
