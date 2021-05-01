class Airport

    CAPACITY = 20

    def initialize(capacity = CAPACITY)
        
        @capacity = capacity
        @planes = []
    end

    def land(plane)
        fail 'Airport Full: Cannot Land' if full?
        @planes.push(plane)
    end

    def take_off(plane)

    end

    def full?
        @planes.length >= @capacity
    end

end