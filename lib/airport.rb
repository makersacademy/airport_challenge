class Airport

    def initialize(capacity = 20)
        @capacity = capacity
        @planes = []
    end

    def land(plane)
        fail 'Airport Full: Cannot Land' if @planes.length >= @capacity
        @planes.push(plane)
    end

    def take_off(plane)

    end

    # def full?
        
    # end

end