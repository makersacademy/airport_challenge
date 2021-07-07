require 'weather_status'
class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20
  
  def initialize(weather_status, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather_status = weather_status
  end
  
  def land(plane)
    fail "Plane already landed" if already_present(plane)
    
    fail "This airport is full" if full? 
    
    raise "Cannot land plane. Weather is stormy" if stormy?
    
    @planes << plane
  end
  
  def take_off(plane)
    fail "the plane is not in airport" unless already_present(plane)
    
    fail "cannot take off. Weather is stormy" if stormy?
    
    @planes.delete(plane)
  end
  
  private
  
  def full?
    @planes.length >= @capacity
  end
  
  def already_present(plane)
    @planes.include?(plane)
  end
  
  def stormy?
    @weather_status.stormy?
  end
end
