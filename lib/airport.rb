require_relative 'plane'

class Airport
  attr_accessor :hangar
  
  DEFAULT_CAPACITY = 10
  
  def initialize
    @hangar = []
  end  
    
  def land(plane)
    airport = Airport.new
    @hangar << plane
    if @hangar.count > airport.capacity
      raise 'Airport at capacity, no room for more planes'
    end
    
    plane.landed?
  end
    
  def capacity
    
    DEFAULT_CAPACITY
    
  end
  
  def take_off(plane)
    if @hangar.include?(plane)
      @hangar.delete(plane)
      "The plane #{plane} has just taken off"
    else "no planes"
    end
    # if @hangar.length < 1
     # "No more planes"
  end
  
  
end
