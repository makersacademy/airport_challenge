require_relative 'plane'

class Airport
  attr_accessor :hangar
  
  DEFAULT_CAPACITY = 10
  
  def initialize
    @hangar = []
  end  
    
  def land(plane)
    airport = Airport.new
    raise "Plane has already landed" if @hangar.include?(plane)
    raise 'Airport at capacity, no room for more planes' if airport.hangar_full
    @hangar << plane
    
    plane.landed?
  end
    
  def capacity
    
    DEFAULT_CAPACITY
    
  end
  
  def hangar_full
    airport = Airport.new
    @hangar.count > airport.capacity
  end
  
  def take_off(plane)
    #if @hangar.include?(plane)
    @hangar.delete(plane)
    plane.taken_off?
    #else "no planes"
    #end
    # if @hangar.length < 1
     # "No more planes"
  end
  
  def count_planes
    @hangar.length
  end
  
end
