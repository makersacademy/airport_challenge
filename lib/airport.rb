require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @landed_planes = []
  end 

  def land(plane)
    fail 'The airport is full.' if full?
    fail 'Cannot land - it is stormy.' if stormy?
    
    @landed_planes.push(plane)
  end

  def take_off(plane)
    fail 'Cannot take off - it is stormy.' if stormy?
    fail 'Cannot take off the plane - the plane is in another airport.' unless @landed_planes.include?(plane) 
  end 

  private

  def full?
    @landed_planes.count >= @capacity
  end 

  def stormy?
    @weather.stormy?
  end

  def serve_food
    Kernel.rand(1..10)
  end
end
