class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    fail "Plane already landed" if already_present(plane)
    
    fail "This airport is full" if full? 
    
    @planes << plane
  end
  
  def take_off(plane)
    fail "the plane is not in airport" unless not_present(plane)
    
    @planes.pop
  end
  
  private
  
  def full?
    @planes.length >= @capacity
  end
  
  def already_present(plane)
    @planes.include?(plane)
  end
  
  def not_present(plane)
    @planes.include?(plane)
  end
end
