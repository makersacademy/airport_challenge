require_relative 'plane'
class Airport
    ::DEFAULT_CAPACITY = 2
    attr_reader :planes
    attr_reader :capacity
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
    end
    def land(plane)
        raise "full" if full?
        @planes << plane
    end
    def take_of(plane)
        @planes.delete(plane)
    end
    def full?
        @planes.length >= DEFAULT_CAPACITY
    end
end
