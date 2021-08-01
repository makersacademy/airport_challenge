DEFAULT_CAPACITY = 20

class Airport
  
  def initialize(limit = DEFAULT_CAPACITY)
    @runway = []
    @capacity = limit
  end
  
  def authorize_landing(plane)
    raise 'Unable to land airport is full!' if full?
    raise 'That plane has already landed!' if  plane.airborne? == false
    raise 'Unable to land during a storm!' if stormy?
    
    @runway << plane
    plane.land
  end
  
  def authorize_take_off(plane)
    raise 'That plane has already taken off!' if plane.airborne? == true
    raise 'That plane is not at this airport!' unless @runway.include?(plane)
    raise 'Unable to take off during a storm!' if stormy?
    
    @runway.delete(plane)
    plane.take_off
  end
  
  def stormy?
    weather = rand(1..20)
    weather == 1 
  end
  
  def full?
    @capacity <= @runway.count
  end
  
end
