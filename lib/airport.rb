class Airport
  attr_reader :plane


  def land_at_airport(plane)
    @plane = plane

  end


  def take_off(plane)
    raise "Take off not permitted weather is stormy" if weather == stormy
    
    @plane

  end


end
