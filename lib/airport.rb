class Airport

    CAPACITY = 20

    def initialize(capacity = CAPACITY)
        
        @capacity = capacity
        @planes = []
    end

    def land(plane)
        fail 'Airport Full: Cannot Land' if full?
        fail 'Stormy: Cannot Land' if stormy?
        @planes.push(plane)
    end

    def take_off(plane)

    end

    private

    def full?
        @planes.length >= @capacity
    end

    def stormy?
        ran_num = rand(1..10)
        ran_num > 7 ? true : false
    end

end