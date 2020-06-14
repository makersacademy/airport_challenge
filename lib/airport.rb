class Airport
  attr_reader :planes
  
  def initialize
    @planes = [] 
  end
  
  def land(plane)
    fail "Plane already landed" if already_present(plane)
    
    fail "This airport is full" if full? 
    
    @planes << plane
  end
  
  def take_off(plane)
    fail "the plane is not in airport" unless already_present(plane)
    
    @planes.pop
  end
  
  private
  
  def full?
    @planes.length >= 20
  end
  
  def already_present(plane)
    @planes.include?(plane)
  end
end
