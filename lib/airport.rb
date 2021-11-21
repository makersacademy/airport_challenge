class Airport
    def initialize(capacity)
        @capacity = capacity
        @planes_landed = []
    end

    def land(plane)
        raise 'cannot land plane as airport full' if @planes_landed.length >= @capacity
        @planes_landed << plane
    end

    def takeoff(plane)

    end
end