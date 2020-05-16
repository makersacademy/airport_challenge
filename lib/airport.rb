require 'weather'

class Airport
    DEFAULT_CAPACITY = 35
    attr_reader :capacity
    attr_accessor :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
     @hangar = []
     @capacity = capacity
  end
 
  def takeoff 
    # fail "Too stormy to take-off" if stormy?
    puts "The flight has taken off"
    @hangar.pop
    true
  end

  def land(plane)
     fail "Airport at capacity" if full?
    @hangar.push(plane) 
end
  
#   def stormy?
#     random_boolean = [true, false].sample
#   end

  def full?
    @hangar.count >= @capacity
  end
end