require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20 
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  def land(plane, weather)
    fail 'Turbulent weather cannot land' if weather.stormy?
    fail 'Airport is full' if full?
    fail 'Plane has already landed' if landed?(plane)

    @planes << plane
  end
  
  def take_off(plane, weather)
    fail 'Turbulent weather cannot takeoff' if weather.stormy?
    fail 'Plane is not in airport' if landed?(plane) == false
 
    @planes.delete(plane)
  end

  def taken_off?(plane)
    @planes.include?(plane) ? false : true
  end

  private
  def full?
    @planes.count >= @capacity
  end

  def landed?(plane)
    @planes.include?(plane)
  end

end
