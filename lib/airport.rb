require_relative 'plane'
require_relative 'weather'
class Airport
    attr_reader :planes
    attr_reader :capacity
    DEFAULT_CAPACITY = 50
    def initialize(capacity= DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end


    def land(plane)
        fail 'airport is full' if full?
        
          @planes.push(plane)
          @planes[@planes.length - 1]
    
    end

    def take_off(weather)
       
       fail 'too stormy to take off' if weather.stormy? == true
        if weather.stormy?
          @planes.pop()
        end
    end


    private
    def full?
        if @planes.count >= DEFAULT_CAPACITY
            true
        end
    end
end