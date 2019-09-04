require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end 

  def weather 
    rand(1..8) > 1 ? @weather = :sunny : @weather = :stormy
  end 

  def take_off(plane)
    fail 'Cannot take off due to stormy weather' unless weather == :sunny
    
    plane.take_off
  end

  def land(plane)
    fail 'Cannot land due to stormy weather' unless weather == :sunny
    fail 'Cannot land - airport full' if full?
    
    @planes << plane
  end

  private 
  
  def full?
    @planes.count >= @capacity
  end
end 
