require_relative 'plane'

class Airport
  
  attr_accessor :cap
  
  def initialize
    @planes = []
    @cap = 1
  end
  
  def capacity(cap)
    "The airport capacity is #{cap}" 
  end
  
  def land(plane)
    raise "Airport is full, plane cannot land" if @planes.count > cap
    
    @planes << plane
  end 
  
  def takeoff(plane)
   
  end  
  
  
end
