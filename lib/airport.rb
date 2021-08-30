class Airport
  def initialize(capacity)
    @capacity = capacity
    @airplanes = []
  end    

  def land(airplane)
    raise 'Airport full: Cannot land' if full? 
    @airplanes << airplane 
  end

  def take_off(airplane)
  end
end

private 

def full?
  @airplanes.length >= @capacity 
end  
