class Airport
    attr_reader :planes, :capacity
    
    def initialize(capacity = 20)
    @capacity = capacity
    @planes = []
    end
    def land(plane)
        fail "Airport is at capacity" if @planes.length > @capacity
        @planes.push(plane)
    end
    def take_off
        @planes.pop
    end 
end
