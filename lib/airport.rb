require_relative 'plane'
require_relative 'weather'
class Airport
    DEFAULT_CAPACITY = 40
attr_accessor :airplanes, :capacity, :weather
    
def initialize(capacity=DEFAULT_CAPACITY)
       @capacity = capacity
        @airplanes = []
        @weather = Weather.new
        
    end

    def takeoff

    end

    def land(plane)
        fail "You can't land, we're full!" if full?
        @airplanes << plane

    end
private

    def full?
        @airplanes.length >= DEFAULT_CAPACITY
    end
end