class Airport 
    DEFAULT_CAPACITY = 20
    attr_reader :capacity

    def initialize(capacity)
        @planes = []
        @capacity = DEFAULT_CAPACITY
    end 

    def land(plane)
        raise 'Airport is full, cannot land the plane' if full?
        raise 'Weather is stormy, cannot land the plane' if stormy?
        # put the plane that just landed into the planes array (@planes)
        @planes << plane
    end 

    def take_off(plane)
        raise 'Weather is stormy, cannot take off the plane' if stormy?
    end 

    private

    def full?
        @planes.length >= @capacity
    end 

    def stormy?
        rand(1..6) > 4
    end 
end 