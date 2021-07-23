class Airport 
    
    
  def initialize(capacity=20)
    @capacity = capacity
    @planes = []
  end
    
  def land(plane)
    raise "Cannot land plane, airport is full" if full?
    raise "Unsafe to land, weather is stormy" if is_stormy?
    @planes.push(plane)
  end
    
  def take_off(plane)
    
  end
  
  def is_stormy?
    if rand(1..10) >= 8 
      true
    else
      false
    end
  end
  
  private
  
  def full? 
    if @planes.count > @capacity
      true
    else
      false
    end
  end
end