require './lib/plane'

class Airport
    
    attr_accessor :capacity :planes
    
    DEFAULT_CAPACITY = 5
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end
    
    def land(plane)
        @planes << plane
    end

end
