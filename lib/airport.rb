require_relative('plane')

class Airport
    attr_accessor :planes, :capacity

    def initialize(capacity = 1)
        @planes = []
        @capacity = capacity
    end

    def land(plane)
        full ? "fail" : @planes << plane && "The plane has landed"
    end
    def takeoff(plane)
        @planes = []
        true
    end
    
    def full
    @planes.count >= @capacity ? true : false
    end
end