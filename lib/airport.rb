require_relative 'plane'

class Airport
    attr_reader :planes
    attr_accessor :capacity

    DEFAULT_CAPACITY = 20
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end

    def land(plane)
        fail 'Airport is full' if planes.count == capacity
        @planes << plane
    end

    def take_off(plane)
        @planes.pop
    end

end