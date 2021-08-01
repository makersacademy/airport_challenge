class Airport
  
  def initialize
    @planes = []
  end
  
  def land(plane)
    fail "Airport is full, plane cannot land" if @planes.count == 5
    
    @planes << plane
  end 
  
  def takeoff(plane)
   
  end  
  
end
