require 'weather'

class Airport
    DEFAULT_CAPACITY = 35
    attr_reader :capacity
    attr_accessor :airport

  def initialize(capacity = DEFAULT_CAPACITY)
     @airport = []
     @capacity = capacity
  end
 
  def takeoff 
    # fail "Too stormy to take-off" if stormy?
    puts "The flight has taken off"
    @airport.pop
    true
  end

  def land(plane)
     fail "Airport at capacity" if full?
    @airport.push(plane) 
end
  
#   def stormy?
#     random_boolean = [true, false].sample
#   end

  def full?
    airport.count >= @capacity
  end
end