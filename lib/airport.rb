
class Airport 
  
  MAXIMUM_CAPACITY = 10
 
  def initialize
    @hangar = []
  end
  
  def land(plane)
    raise "Hangar full" if @hangar.count == MAXIMUM_CAPACITY
    @hangar << plane
    capacity_check
  end
  
  def take_off(plane)
    @hangar.pop 
    capacity_check 
  end
  
  def capacity_check
    @hangar.count
  end
  
end