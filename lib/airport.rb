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
    
    raise "Cannot land plane. Weather is stormy" if stormy?
    
    @planes << plane
  end
  
  def take_off(plane)
    fail "the plane is not in airport" unless already_present(plane)
    
    @planes.delete(plane)
  end
  
  private
  
  def full?
    @planes.length >= @capacity
  end
  
  def already_present(plane)
    @planes.include?(plane)
  end
  
  def stormy?
    # i want it to be stormy randomly. let's say 1/3 of the time. 
    # so do a random die role 
    # this method is all we need. if rand is 1 to 4, evaluates to false
    # and so weather is not stormy and a plane can land!
    # if rand is 5 or 6, evaluates to true, weather is stormy and plane cannat land
    rand(1..6) > 4
  end
end
