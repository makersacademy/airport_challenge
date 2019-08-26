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
  
  def initialize
    @hangar = []
    @weather = Weather.new
  end
	
  def land(plane)
    # simulating a 5% chance of stormy weather with a random float 0 < f < 1   
    fail "Landing not permitted due to weather" unless (@weather.check > 0.05)
    
    @hangar << plane
  end
	
  def take_off(plane)
    # simulating a 5% chance of stormy weather with a random float 0 < f < 1   
    fail "Take-off not permitted due to weather" unless (@weather.check > 0.05)
    
    @hangar.delete(plane)
  end
end
