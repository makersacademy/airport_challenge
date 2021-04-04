require_relative 'plane'
require_relative 'weather'

class Airport 
  attr_reader :planes, :weather
  DEFAULT_CAPACITY = 50

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end 

  def land(plane)
    raise 'Airport full, do not land' if @planes.count >= DEFAULT_CAPACITY
    raise 'Stormy weather, do not land' if stormy?
    
    @planes << plane
  end 

  def takeoff(*)
    raise 'Stormy weather, do not take off' if stormy?
    
    @planes.pop
  end 

  def plane_status(plane)
    if @planes.include?(plane)
      true
    else 
      false
    end 
  end 
end 
