require_relative 'plane'
class Airport 
  attr_reader :planes
  DEFAULT_CAPACITY = 50
  def initialize
    @planes = []
  end 

  def land(plane)
    fail 'Airport full, do not land' if @planes.count >= DEFAULT_CAPACITY
        
    @planes << plane
  end 

  def takeoff(*)
    @planes.pop
  end 

  def include?(plane)
    if @planes.include?(plane)
      true
    else 
      false
    end 
  end 
end 
