class Airport
    DEFAULT_CAPACITY = 15
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes_landed = []
    end

    def land(plane)
        raise 'cannot land plane as airport full' if full?
        raise 'cannot land plane: its stormy' if stormy?
        @planes_landed << plane
    end

    def takeoff(plane)
        raise 'cannot land plane: its stormy' if stormy?
    end
    
    private

    def full?
        @planes_landed.length >= @capacity
    end

    def stormy?
        rand(1..6) > 4
    end
end