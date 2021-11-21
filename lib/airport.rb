class Airport
    attr_reader :planes
    def initialize(capacity = 1)
        @planes = []
        @capacity = capacity
    end

    def land(plane)
        raise "Airport full" if @planes.length == @capacity
        @planes << plane
    end

    def takeoff(plane)
        @planes.delete(plane)
    end
end