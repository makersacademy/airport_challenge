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


    def land(plane, weather)
        fail 'airport is full' if full?
        fail 'too stormy to land' if weather.stormy? == true
          @planes.push(plane)
          @planes[@planes.length - 1]
    
    end

    def take_off(weather)
       
       fail 'too stormy to take off' if weather.stormy? == true
        if weather.stormy? == false
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