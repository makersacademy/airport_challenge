class Airport
  attr_accessor :landed_planes

  def initialize
  @landed_planes = []
  end

  def land(plane)
  @landed_planes << plane
  end

  def take_off(plane)
    
    @landed_planes.delete(plane)
    p "#{plane} has taken off and is no longer in the airport" 
   
   
  end


  

end