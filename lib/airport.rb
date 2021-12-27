class Airport 
    DEFAULT_CAPACITY = 20

    attr_reader :capacity

    def initialize(capacity=DEFAULT_CAPACITY)
        @planes = []
        @capacity = DEFAULT_CAPACITY
    end 

    def land(plane)
        fail 'Airport is full, cannot land the plane' if full?
        # put the plane that just landed into the planes array (@planes)
        @planes << plane
    end 

    def take_off(plane)
    end 

    private

    def full?
        @planes.length >= @capacity
    end 
end 