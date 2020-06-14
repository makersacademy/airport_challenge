require_relative 'plane'

class Airport
  attr_accessor :hangar
  
  DEFAULT_CAPACITY = 10
  
  def initialize
    @hangar = []
  end  
    
  def land(plane)
    raise 'Airport at capacity, no room for more planes' if @hangar.count > DEFAULT_CAPACITY
    
    @hangar << plane
    plane.landed?
  end
    
  def capacity
    
    DEFAULT_CAPACITY
    
  end
  
  def take_off(plane)
    
    @hangar.delete(plane)
    plane.taken_off?
  end
  
  def count_planes
    @hangar.length
  end
  
end
