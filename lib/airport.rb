require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_reader :hangar
  attr_reader :weather
  attr_reader :capacity
  STORM_CHANCE = 0.05
  
  def initialize(capacity = 20)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end
	
  def land(plane)
    unless (@weather.check > STORM_CHANCE)
      fail "Landing not permitted due to weather"
    end
    
    fail "No available space for this plane" unless @hangar.count < @capacity
    
    fail "Plane is already on the ground" if plane.status == "landed"
    
    @hangar << plane
    plane.status = "landed"
  end
	
  def take_off(plane)
    unless (@weather.check > STORM_CHANCE)
      fail "Take-off not permitted due to weather" 
    end
    
    @hangar.delete(plane)
    plane.status = "flying"
  end
end
