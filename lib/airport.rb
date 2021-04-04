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
    raise 'cant take of, is stormy' if stormy?
    @planes.delete(plane)
    plane
  end
  private 
  attr_reader :capacity
  def full?
    planes.length >= capacity
  end
  def stormy?
    rand(1..6)>4
  end

end
