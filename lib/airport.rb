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

    @planes << plane
  end
  
  def take_off(plane, weather)
    fail 'Turbulent weather cannot takeoff' if weather.stormy?

    @planes.delete(plane)
  end

  def taken_off?(plane)
    @planes.include?(plane) ? false : true
  end

  def full?
    @planes.count >= @capacity
  end

end
