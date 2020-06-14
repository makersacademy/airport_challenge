class Airport
  attr_reader :planes
  
  def initialize
    @planes = [] 
  end
  
  def land(plane)
    fail "Plane already landed" if @planes.include?(plane)
    
    @planes << plane
  end
  
  def take_off(plane)
    fail "the plane is not in airport" unless @planes.include?(plane)
    
    @planes.pop
  end
end
