require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20 
attr_reader :planes, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather
    @capacity = capacity
  end
  
  def land(plane, weather)
    fail 'Turbulent weather cannot land' if weather.stormy? == true
    fail 'Airport is full' if @planes.count >= @capacity
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
