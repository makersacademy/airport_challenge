require_relative 'plane'
require_relative 'weather'
class Airport
DEFAULT_CAPACITY = 40
attr_accessor :airplanes, :capacity, :condition
    
    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @airplanes = []
        @condition = Weather.new
        
    end

    def takeoff
       fail "There are no planes!" if @airplanes.empty? 
       @airplanes.pop
    end

    def land(plane)
        fail "You can't land, we're full!" if full?
        fail "You can't land - the weather is crap!" if self.condition.crap_weather?
        @airplanes << plane
    end

private

    def full?
        @airplanes.length >= DEFAULT_CAPACITY
    end

end