class Weather
  
  def check
    rand
  end
end

class Plane
end

class Airport
  attr_reader :hangar
  attr_reader :weather
  STORM_CHANCE = 0.05
  
  def initialize
    @hangar = []
    @weather = Weather.new
  end
	
  def land(plane)
    unless (@weather.check > STORM_CHANCE)
      fail "Landing not permitted due to weather"
    end
    
    @hangar << plane
  end
	
  def take_off(plane)
    unless (@weather.check > STORM_CHANCE)
      fail "Take-off not permitted due to weather" 
    end
    
    @hangar.delete(plane)
  end
end
