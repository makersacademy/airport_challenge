require_relative 'plane'
require_relative 'weather'
class Airport
    attr_reader :planes
    attr_reader :capacity
    DEFAULT_CAPACITY = 50
    def initialize(capacity= DEFAULT_CAPACITY)
        @weather = Weather.new
        
        
        @capacity = capacity
        @planes = []
    end


    def land(plane)
        fail 'airport is full' if full?
        @planes.push(plane)
        @planes[@planes.length - 1]
    end

    def take_off
        @weather.condition
        p @weather.condition
        
       @planes.pop()
    end


    private
    def full?
        if @planes.count >= DEFAULT_CAPACITY
            true
        end
    end
end