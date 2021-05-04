require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :plane
  attr_reader :capacity
  attr_reader :airport
  attr_reader :weather
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end
  
  def land(plane)
    fail 'This plane has already landed' if airport.include?(plane) 
    fail 'Unable to land - the weather is currently stormy' if weather == "stormy"
    fail 'No space available' if full?
  
    airport << plane
  end

  def takeoff(plane)
    fail "This plane has already taken off" if airport.none?(plane)
    fail 'Unable to take off - the weather is currently stormy' if weather == "stormy"
    airport.pop
  end

  def full?
    airport.count >= capacity
  end
end
