class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end
  
  def land(plane)
    raise "Cannot land plane, Airport full." if full?
    raise "Cannot land plane, weather is stormy." if stormy?
    @planes << plane
  end 

  def take_off(plane)
  end

 private
  def stormy?
    rand(1..6) > 4
  end  

  def full?
    @planes.length >= @capacity
  end 
end