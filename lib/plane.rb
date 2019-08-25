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
    fail "Landing not permitted due to weather conditions" unless (@weather.check > 0.05)
    @hangar << plane
  end
	
  def take_off(plane)
    @hangar.delete(plane)
  end
end
