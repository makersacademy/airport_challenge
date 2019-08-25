class Weather
  attr_reader :current_weather
  
  def check
    rand
  end
end

class Plane
end

class Airport
  attr_reader :hangar
	
  def initialize
    @hangar = []
  end
	
  def land(plane)
    @hangar << plane
  end
	
  def take_off(plane)
    @hangar.delete(plane)
  end
end
