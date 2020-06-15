require_relative 'plane'

class Airport
  attr_accessor :hangar
  attr_reader :capacity
  
  DEFAULT_CAPACITY = 10
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end  
    
  def land(plane)
    raise 'Airport at capacity, no room for more planes' if full?
    
    @hangar << plane
    plane.landed?
  end
  
  def take_off(plane)
    
    @hangar.pop
    plane.taken_off?
  end
  
  def count_planes
    @hangar.length
  end
  
  def full?
    @hangar.count >= capacity
  end
  
end
