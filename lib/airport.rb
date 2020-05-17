require 'weather'
require 'plane'

class Airport
  DEFAULT_CAPACITY = 35
  attr_accessor :capacity
  attr_accessor :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    
  end
 
  def take_off(plane)
    @hangar.delete(plane)
    true
  end

  def location(plane)
    @hangar.include?(plane)  
  end

  def land(plane)
    fail "Airport at capacity" if full?

    @hangar.push(plane) 
  end

  def full?
    @hangar.count >= @capacity
  end
end