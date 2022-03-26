class Airport
  attr_reader :plane
  
  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end
  
  def takeoff
    @plane.pop 
  end

end
