class Airport
  attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end
  
  def takeoff
    plane_that_took_off = @plane.last
    @plane.pop 
    return plane_that_took_off
  end
  
end
