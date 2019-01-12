require_relative 'plane'
require_relative 'weather'

class Airport
 
attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather
  end
  
  def land(plane, weather)
    fail 'Turbulent weather cannot land' if weather.stormy? == true
    @planes << plane
  end
  
  def take_off(plane, weather)
    fail 'Turbulent weather cannot takeoff' if weather.stormy? == true
    @planes.delete(plane)
  end

  def taken_off?(plane)
    @planes.include?(plane) ? false : true
  end

end
