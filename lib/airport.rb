require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 2
  attr_reader :planes
    
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
   
  end
  
  def land(plane)
    raise 'Airport full:take of a plane to land this one' if full?
    
    @planes << plane
  end
  
  def take_of(plane)
    @planes.delete(plane)
    plane
  end
  private 
  attr_reader :capacity
  def full?
    planes.length >= capacity
  end
end
