require 'plane'

class Airport
    attr_reader :planes
    attr_reader :capacity
    
    DEFAULT_CAPACITY = 100

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end

    def land(plane)
        fail 'Cannot land, airport full' if @planes.size == @capacity
        @planes << plane
    end

    def take_off(plane)
        @planes.pop
    end

    def weather
    end

end